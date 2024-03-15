import 'package:ecommerce_clean_arch/featrues/products/data/models/product_model.dart';

abstract class LocalDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(String id);
}
