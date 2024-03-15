import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<Either<Failure, String>> call(String id) async {
    return await repository.deleteProduct(id);
  }
}
