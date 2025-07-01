import 'package:assignment/features/home/domain/entities/partner_entity.dart';
import 'package:assignment/features/home/presentation/providers/home_provider.dart';
import 'package:assignment/core/common/common_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PartnersTable extends StatelessWidget {
  const PartnersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final partnersAsync = ref.watch(partnersProvider);

        return partnersAsync.when(
          data: (partners) {
            final tableData =
                partners
                    .map(
                      (partner) => TableRowData(
                        id: partner.id,
                        name: partner.name,
                        picture: partner.picture,
                        contactInfo: partner.email,
                        onDelete:
                            () => ref
                                .read(partnersProvider.notifier)
                                .deletePartner(partner.id),
                      ),
                    )
                    .toList();

            return CommonTable(
              title: 'Partners',
              headerColor: Colors.green.shade100,
              contactLabel: 'Email',
              contactColor: Colors.green,
              data: tableData,
              isEmpty: partners.isEmpty,
            );
          },
          error: (error, _) {
            return CommonTable(
              title: 'Partners',
              headerColor: Colors.green.shade100,
              contactLabel: 'Email',
              contactColor: Colors.green,
              data: [],
              error: error.toString(),
            );
          },
          loading: () {
            return CommonTable(
              title: 'Partners',
              headerColor: Colors.green.shade100,
              contactLabel: 'Email',
              contactColor: Colors.green,
              data: [],
              isLoading: true,
            );
          },
        );
      },
    );
  }
}
