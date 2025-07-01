// lib/features/home/data/repositories/home_repository_impl.dart
import 'package:assignment/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/entities/partner_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/customer_model.dart';
import '../models/partner_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CustomerEntity>>> getCustomersData() async {
    try {
      final isConnected = await networkInfo.isConnected;
      if (!isConnected) {
        return Left(NetworkFailure('No internet connection'));
      }
      final List<CustomerModel> customers =
          await remoteDataSource.getCustomersData();
      return Right(customers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PartnerEntity>>> getPartnersData() async {
    try {
      final isConnected = await networkInfo.isConnected;

      if (!isConnected) {
        return Left(NetworkFailure('No internet connection'));
      }
      final List<PartnerModel> partners =
          await remoteDataSource.getPartnersData();

      return Right(partners);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
