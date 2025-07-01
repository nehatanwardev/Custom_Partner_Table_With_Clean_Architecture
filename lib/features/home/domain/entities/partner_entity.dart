import 'package:equatable/equatable.dart';

class PartnerEntity extends Equatable {
  final String picture;
  final int id;
  final String name;
  final String email;

  const PartnerEntity({
    required this.picture,
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
}
