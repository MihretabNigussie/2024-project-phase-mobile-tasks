import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/exceptions/exception.dart';
import 'package:ecommerce_clean_arch/core/failures/failure_impl.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> addProduct(
      String name, String description, double price) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProduct(
      String query) async {
    try {
      final products = await remoteDataSource.searchProduct(query);
      print('************************ Products $products');
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Error'));
    }
  }

  @override
  Future<Either<Failure, String>> updateProduct(
      String id, String name, String description, num price) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
