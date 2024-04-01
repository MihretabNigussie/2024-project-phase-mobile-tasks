import 'package:ecommerce_clean_arch/featrues/products/data/models/product_model.dart';

abstract class RemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(String id);
  Future<List<ProductModel>> searchProduct(String query);
  Future<String> addProduct(String name, String description, double price);
  Future<String> updateProduct(
      String id, String name, String description, num price);
  Future<String> deleteProduct(String id);
}
