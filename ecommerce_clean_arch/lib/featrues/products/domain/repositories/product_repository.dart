import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProduct(String id);
  Future<Either<Failure, List<ProductEntity>>> searchProduct(String query);
  Future<Either<Failure, String>> addProduct(
      String name, String description, double price);
  Future<Either<Failure, String>> updateProduct(
      String id, String name, String description, num price);
  Future<Either<Failure, String>> deleteProduct(String id);
}
