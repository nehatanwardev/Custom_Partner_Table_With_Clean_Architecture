import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String picture;
  final int id;
  final String name;
  final String mobileNumber;

  const CustomerEntity({
    required this.picture,
    required this.id,
    required this.name,
    required this.mobileNumber,
  });

  @override
  List<Object?> get props => [id, name, mobileNumber, picture];
}
