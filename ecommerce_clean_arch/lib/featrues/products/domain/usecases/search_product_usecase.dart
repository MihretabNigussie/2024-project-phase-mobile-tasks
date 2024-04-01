import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';

class SearchProductUsecase {
  final ProductRepository repository;

  SearchProductUsecase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call(String query) async {
    return repository.searchProduct(query);
  }
}
