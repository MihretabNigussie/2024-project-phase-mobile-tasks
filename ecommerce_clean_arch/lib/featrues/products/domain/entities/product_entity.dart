import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final num price;
  final String category;
  final String image;

  const ProductEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.image});

  @override
  List<Object?> get props => [id, title, description, price, category, image];
}

class RatingEntity extends Equatable {
  final num rate;
  final num count;

  const RatingEntity({required this.rate, required this.count});

  @override
  List<Object?> get props => [rate, count];
}
