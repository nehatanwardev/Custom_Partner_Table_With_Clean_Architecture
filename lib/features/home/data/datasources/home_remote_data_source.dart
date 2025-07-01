import 'package:assignment/core/constants/api_constants.dart';

import '../../../../core/network/api_client.dart';
import '../models/customer_model.dart';
import '../models/partner_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CustomerModel>> getCustomersData();
  Future<List<PartnerModel>> getPartnersData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<CustomerModel>> getCustomersData() async {
    final List<dynamic> jsonList = await apiClient.get(
      ApiConstants.getAllCustomers,
    );
    return jsonList.map((json) => CustomerModel.fromJson(json)).toList();
  }

  @override
  Future<List<PartnerModel>> getPartnersData() async {
    final List<dynamic> jsonList = await apiClient.get(
      ApiConstants.getAllPartners,
    );
    return jsonList.map((json) => PartnerModel.fromJson(json)).toList();
  }
}
