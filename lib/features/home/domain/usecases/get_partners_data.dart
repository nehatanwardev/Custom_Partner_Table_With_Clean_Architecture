import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/features/home/domain/entities/partner_entity.dart';
import 'package:assignment/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetPartnersData {
  final HomeRepository repository;

  GetPartnersData(this.repository);

  Future<Either<Failure, List<PartnerEntity>>> call() async {
    return await repository.getPartnersData();
  }
}
