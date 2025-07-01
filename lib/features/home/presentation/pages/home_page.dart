import 'package:assignment/features/home/presentation/providers/home_provider.dart';
import 'package:assignment/features/home/presentation/widgets/add_customer_dialog.dart';
import 'package:assignment/features/home/presentation/widgets/add_partner_dialog.dart';
import 'package:assignment/features/home/presentation/widgets/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/customers_table.dart';
import '../widgets/partners_table.dart';
import '../widgets/add_item_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Customers Section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customers',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    AddItemButton(
                      itemName: 'Customer',
                      color: Colors.blue,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AddCustomerDialog(),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Consumer(
                      builder: (context, ref, child) {
                        return CustomRefreshButton(
                          onTap: () {
                            ref.read(customersProvider.notifier).refresh();
                          },
                          color: Colors.white,
                          backgroundColor: Colors.blue,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(flex: 1, child: CustomersTable()),

              const SizedBox(height: 32),

              // Partners Section
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Partners',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    AddItemButton(
                      itemName: 'Partner',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AddPartnerDialog(),
                        );
                      },
                      color: Colors.green,
                    ),
                    const SizedBox(width: 10),
                    Consumer(
                      builder: (context, ref, child) {
                        return CustomRefreshButton(
                          onTap: () {
                            ref.read(partnersProvider.notifier).refresh();
                          },
                          color: Colors.white,
                          backgroundColor: Colors.green,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(flex: 1, child: PartnersTable()),
            ],
          ),
        ),
      ),
    );
  }
}
