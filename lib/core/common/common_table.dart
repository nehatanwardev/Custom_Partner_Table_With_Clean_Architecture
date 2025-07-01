import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableRowData {
  final int id;
  final String name;
  final String picture;
  final String contactInfo;
  final VoidCallback onDelete;

  TableRowData({
    required this.id,
    required this.name,
    required this.picture,
    required this.contactInfo,
    required this.onDelete,
  });
}

class CommonTable extends StatelessWidget {
  final String title;
  final Color headerColor;
  final String contactLabel;
  final Color contactColor;
  final List<TableRowData> data;
  final bool isLoading;
  final String? error;
  final bool isEmpty;

  const CommonTable({
    super.key,
    required this.title,
    required this.headerColor,
    required this.contactLabel,
    required this.contactColor,
    required this.data,
    this.isLoading = false,
    this.error,
    this.isEmpty = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Picture',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          headerColor == Colors.blue.shade100
                              ? Colors.blue.shade800
                              : Colors.green.shade800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          headerColor == Colors.blue.shade100
                              ? Colors.blue.shade800
                              : Colors.green.shade800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    contactLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          headerColor == Colors.blue.shade100
                              ? Colors.blue.shade800
                              : Colors.green.shade800,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Action',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          headerColor == Colors.blue.shade100
                              ? Colors.blue.shade800
                              : Colors.green.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Table Body
          Expanded(child: _buildTableBody()),
        ],
      ),
    );
  }

  Widget _buildTableBody() {
    if (isLoading) {
      return _buildShimmer();
    }

    if (error != null) {
      return Center(child: Text(error!, style: TextStyle(color: Colors.red)));
    }

    if (isEmpty) {
      return const Center(child: Text('Table is empty'));
    }

    if (data.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final rowData = data[index];
        return CommonTableRow(rowData: rowData, contactColor: contactColor);
      },
    );
  }

  Widget _buildShimmer() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Row(
            children: [
              // Picture shimmer
              Expanded(
                flex: 1,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Name shimmer
              Expanded(
                flex: 2,
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Contact shimmer
              Expanded(
                flex: 1,
                child: Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Action shimmer
              Expanded(
                flex: 1,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CommonTableRow extends StatefulWidget {
  final TableRowData rowData;
  final Color contactColor;

  const CommonTableRow({
    super.key,
    required this.rowData,
    required this.contactColor,
  });

  @override
  State<CommonTableRow> createState() => _CommonTableRowState();
}

class _CommonTableRowState extends State<CommonTableRow> {
  bool showContact = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          // Picture
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: Image.network(
                  widget.rowData.picture,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.contactColor == Colors.blue
                            ? Icons.person
                            : Icons.business,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Name
          Expanded(
            flex: 2,
            child: Text(
              widget.rowData.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),

          // Contact Info
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showContact = !showContact;
                });
              },
              child: Text(
                showContact ? widget.rowData.contactInfo : 'View',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: showContact ? Colors.black : widget.contactColor,
                  decoration:
                      showContact
                          ? TextDecoration.none
                          : TextDecoration.underline,
                ),
              ),
            ),
          ),

          // Action
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: widget.rowData.onDelete,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
