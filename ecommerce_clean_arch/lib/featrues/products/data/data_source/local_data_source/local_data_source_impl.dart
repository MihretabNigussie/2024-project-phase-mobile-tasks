import 'package:ecommerce_clean_arch/featrues/products/data/data_source/local_data_source/local_data_source.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/models/product_model.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<ProductModel> getProduct(String id) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
