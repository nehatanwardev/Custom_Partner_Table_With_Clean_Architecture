import 'package:dartz/dartz.dart';
import '../entities/customer_entity.dart';
import '../entities/partner_entity.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CustomerEntity>>> getCustomersData();
  Future<Either<Failure, List<PartnerEntity>>> getPartnersData();
}
