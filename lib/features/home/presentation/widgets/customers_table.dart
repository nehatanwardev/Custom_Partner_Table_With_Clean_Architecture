import 'package:assignment/features/home/domain/entities/customer_entity.dart';
import 'package:assignment/features/home/presentation/providers/home_provider.dart';
import 'package:assignment/core/common/common_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomersTable extends StatelessWidget {
  const CustomersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final customersAsync = ref.watch(customersProvider);

        return customersAsync.when(
          data: (customers) {
            final tableData =
                customers
                    .map(
                      (customer) => TableRowData(
                        id: customer.id,
                        name: customer.name,
                        picture: customer.picture,
                        contactInfo: customer.mobileNumber,
                        onDelete:
                            () => ref
                                .read(customersProvider.notifier)
                                .deleteCustomer(customer.id),
                      ),
                    )
                    .toList();

            return CommonTable(
              title: 'Customers',
              headerColor: Colors.blue.shade100,
              contactLabel: 'Mobile Number',
              contactColor: Colors.blue,
              data: tableData,
              isEmpty: customers.isEmpty,
            );
          },
          error: (error, _) {
            return CommonTable(
              title: 'Customers',
              headerColor: Colors.blue.shade100,
              contactLabel: 'Mobile Number',
              contactColor: Colors.blue,
              data: [],
              error: error.toString(),
            );
          },
          loading: () {
            return CommonTable(
              title: 'Customers',
              headerColor: Colors.blue.shade100,
              contactLabel: 'Mobile Number',
              contactColor: Colors.blue,
              data: [],
              isLoading: true,
            );
          },
        );
      },
    );
  }
}
