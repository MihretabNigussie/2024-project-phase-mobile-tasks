import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateProductUsecase {
  final ProductRepository repository;

  UpdateProductUsecase(this.repository);

  Future<Either<Failure, String>> call(ProductParams product) async {
    return repository.updateProduct(
        product.id, product.name, product.description, product.price);
  }
}

class ProductParams extends Equatable {
  final String id;
  final String name;
  final String description;
  final num price;
  const ProductParams(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [id, name, description, price];
}
