import 'package:assignment/core/network/api_client.dart';
import 'package:assignment/core/network/network_info.dart';
import 'package:assignment/features/home/data/datasources/home_remote_data_source.dart';
import 'package:assignment/features/home/data/repositories/home_repository_impl.dart';
import 'package:assignment/features/home/domain/entities/customer_entity.dart';
import 'package:assignment/features/home/domain/entities/partner_entity.dart';
import 'package:assignment/features/home/domain/repositories/home_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(ref.read(connectivityProvider));
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final homeRemoteDataSourceProvider = Provider<HomeRemoteDataSource>((ref) {
  return HomeRemoteDataSourceImpl(apiClient: ref.read(apiClientProvider));
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl(
    remoteDataSource: ref.read(homeRemoteDataSourceProvider),
    networkInfo: ref.read(networkInfoProvider),
  );
});

class CustomersProvider extends AsyncNotifier<List<CustomerEntity>> {
  @override
  Future<List<CustomerEntity>> build() async {
    final customers = await ref.read(homeRepositoryProvider).getCustomersData();
    return customers.fold((left) => throw (left.message), (right) => right);
  }

  Future<void> refresh() async {
    try {
      state = const AsyncValue.loading();
      await Future.delayed(Duration(milliseconds: 400));
      final customers = await build();
      state = AsyncValue.data(customers);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteCustomer(int id) async {
    final updatedCustomers =
        state.value?.where((customer) => customer.id != id).toList() ?? [];
    state = AsyncValue.data(updatedCustomers);
  }

  Future<void> addCustomer(CustomerEntity customer) async {
    final List<CustomerEntity> updatedCustomers = [
      ...state.valueOrNull ?? [],
      customer,
    ];
    state = AsyncValue.data(updatedCustomers);
    print("customers added: ${updatedCustomers}");
  }
}

class PartnersProvider extends AsyncNotifier<List<PartnerEntity>> {
  @override
  Future<List<PartnerEntity>> build() async {
    final partners = await ref.read(homeRepositoryProvider).getPartnersData();
    return partners.fold((left) => throw (left.message), (right) => right);
  }

  Future<void> refresh() async {
    try {
      state = const AsyncValue.loading();
      await Future.delayed(Duration(milliseconds: 400));
      final customers = await build();
      state = AsyncValue.data(customers);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deletePartner(int id) async {
    final updatedParteners =
        state.value?.where((partner) => partner.id != id).toList() ?? [];
    state = AsyncValue.data(updatedParteners);
  }

  Future<void> addPartner(PartnerEntity partner) async {
    final List<PartnerEntity> updatedPartners = [
      ...state.valueOrNull ?? [],
      partner,
    ];
    state = AsyncValue.data(updatedPartners);
  }
}

final customersProvider =
    AsyncNotifierProvider<CustomersProvider, List<CustomerEntity>>(
      () => CustomersProvider(),
    );

final partnersProvider =
    AsyncNotifierProvider<PartnersProvider, List<PartnerEntity>>(
      () => PartnersProvider(),
    );
