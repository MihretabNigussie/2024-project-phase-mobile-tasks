import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/exceptions/exception.dart';
import 'package:ecommerce_clean_arch/core/failures/failure_impl.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/core/network/network_info.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/data_source/local_data_source/local_data_source.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> addProduct(
      String name, String description, double price) async {
    try {
      final result =
          await remoteDataSource.addProduct(name, description, price);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProduct(String id) async {
    try {
      final result = await remoteDataSource.deleteProduct(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getProduct(id);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(message: 'Server Failure'));
      }
    } else {
      try {
        final result = await localDataSource.getProduct(id);
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, String>> updateProduct(
     String id, String name, String description, num price) async {
    try {
      final result =
          await remoteDataSource.updateProduct(id, name, description, price);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getProducts();
        // localDataSource.cacheProducts(result);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(message: 'Server Failure'));
      }
    } else {
      try {
        final result = await localDataSource.getProducts();
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
