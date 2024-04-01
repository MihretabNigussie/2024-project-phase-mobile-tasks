import 'dart:convert';

import 'package:ecommerce_clean_arch/core/exceptions/exception.dart';
import 'package:ecommerce_clean_arch/featrues/products/data/models/product_model.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce_clean_arch/featrues/products/data/data_source/remote_data_source/remote_data_source.dart';

class RemoteDataSoruceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSoruceImpl({required this.client});

  @override
  Future<String> addProduct(
      String name, String description, double price) async {
    final response = await client.post(
        Uri.parse('https://ecommerce.com/products'),
        body: <String, String>{
          'name': name,
          'description': description,
          'price': price.toString(),
        });

    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw ServerException(message: response.body.toString());
    }
  }

  @override
  Future<String> deleteProduct(String id) async {
    final response = await client.delete(
      Uri.parse('https://ecommerce.com/products/$id'),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException(message: response.body.toString());
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(
      Uri.parse('https://ecommerce.com/products/$id'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ServerException(message: response.body.toString());
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(
      Uri.parse('https://ecommerce.com/products'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ServerException(message: response.body.toString());
    }
  }

  @override
  Future<String> updateProduct(
      String id, String name, String description, num price) async {
    final response = await client.put(
      Uri.parse('https://ecommerce.com/products/$id'),
      body: <String, String>{
        'name': name,
        'description': description,
        'price': price.toString(),
      },
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ServerException(message: response.body.toString());
    }
  }

  @override
  Future<List<ProductModel>> searchProduct(String query) async {
    Map<String, dynamic> queryParameters = {'title': query};
    final response = await client.get(
      Uri.parse('https://products-api-5a5n.onrender.com/api/v1/products')
          .replace(queryParameters: queryParameters),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['products'];
      print(jsonData);
      return jsonData.map((data) => ProductModel.fromJson(data)).toList();
    } else {
      throw ServerException(message: response.body.toString());
    }
  }
}
