import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean_arch/core/failures/failures.dart';
import 'package:ecommerce_clean_arch/core/usecases/usecases.dart';
import 'package:ecommerce_clean_arch/featrues/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';

class AddProductUseCase implements UseCase<String, ProductParams> {
  final ProductRepository productRepository;

  AddProductUseCase(this.productRepository);

  @override
  Future<Either<Failure, String>> call(ProductParams product) async {
    return await productRepository.addProduct(
        product.name, product.description, product.price);
  }
}

class ProductParams extends Equatable {
  final String name;
  final String description;
  final double price;
  const ProductParams(
      {required this.name, required this.description, required this.price});

  @override
  List<Object?> get props => [id, name, description, price];
}
