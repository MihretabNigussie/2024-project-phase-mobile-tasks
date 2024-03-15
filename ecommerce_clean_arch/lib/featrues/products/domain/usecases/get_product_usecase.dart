import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';

class GetProductUsecase {
  final ProductRepository repository;

  GetProductUsecase(this.repository);

  Future<Either<Failure, ProductEntity>> call(String id) async {
    return await repository.getProduct(id);
  }
}
