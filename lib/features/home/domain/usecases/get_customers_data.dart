import 'package:assignment/core/errors/failures.dart';
import 'package:assignment/features/home/domain/entities/customer_entity.dart';
import 'package:assignment/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetCustomersData {
  final HomeRepository repository;

  GetCustomersData(this.repository);

 Future<Either<Failure, List<CustomerEntity>>> call() async {
    return await repository.getCustomersData();
  }
}
