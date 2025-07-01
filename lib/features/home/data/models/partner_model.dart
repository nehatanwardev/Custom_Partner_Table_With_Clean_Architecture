import 'package:assignment/features/home/domain/entities/partner_entity.dart';
import 'package:equatable/equatable.dart';

class PartnerModel extends PartnerEntity implements Equatable {
  const PartnerModel({
    required super.picture,
    required super.id,
    required super.name,
    required super.email,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) {
    return PartnerModel(
      picture:
          'https://i.pravatar.cc/150?img=${DateTime.now().microsecondsSinceEpoch % 70}',
      id: json['partner_id'] ?? 0,
      name: json['partner_name'] ?? '',
      email: json['email_address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partner_id': id,
      'partner_name': name,
      'email_address': email,
      'picture': picture,
    };
  }
}
