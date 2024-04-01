import 'package:ecommerce_clean_arch/featrues/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required String id,
    required String title,
    required String description,
    required String category,
    required String image,
    required num price,

  }) : super(
          id: id,
          title: title,
          description: description,
          price: price,
          category: category,
          image: image,
          
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        category: json['category'],
        image: json['image'],
        );
  }
}

class RatingModel extends RatingEntity {
  const RatingModel({
    required num rate,
    required num count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rate': rate,
      'count': count,
    };
  }
}
