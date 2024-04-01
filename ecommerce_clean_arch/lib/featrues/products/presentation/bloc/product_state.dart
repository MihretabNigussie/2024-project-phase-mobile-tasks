part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class SearchProductsLoading extends ProductState {}

class SearchProductsSuccess extends ProductState {
  final List<ProductEntity> products;

  const SearchProductsSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class NoSearchProductFound extends ProductState {
  final String message;

  const NoSearchProductFound(this.message);

  @override
  List<Object> get props => [message];
}

class SearchProductError extends ProductState {
  final String message;

  SearchProductError({required this.message});

  @override
  List<Object> get props => [message];
}
