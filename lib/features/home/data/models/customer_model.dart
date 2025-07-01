import 'package:assignment/features/home/domain/entities/customer_entity.dart';
import 'package:equatable/equatable.dart';

class CustomerModel extends CustomerEntity implements Equatable {
  const CustomerModel({
    required super.picture,
    required super.id,
    required super.name,
    required super.mobileNumber,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      picture:
          'https://i.pravatar.cc/150?img=${DateTime.now().microsecondsSinceEpoch % 70}',
      id: json['customer_id'] ?? 0,
      name: json['name'] ?? '',
      mobileNumber: json['mobile_number'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': id,
      'name': name,
      'mobile_number': mobileNumber,
      'picture': picture,
    };
  }
}
