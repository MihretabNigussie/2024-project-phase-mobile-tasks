import 'product.dart';

class ProductManager {
  List<Product> products = [];

  ProductManager({required products});

  void add(Product product) {
    products.add(product);
  }

  List<Product>? viewAll() {
    if (products.length == 0) {
      print("No Product is found");
      return null;
    }
    return products;
  }

  Map<String, dynamic>? viewSingleProduct(String title) {
    for (Product product in products) {
      if (product.getTitle == title) {
        return product.getProductDetails();
      }
    }

    return null;
  }

  void editProuctTitle({required String oldTitle, required String newTitle}) {
    for (Product product in products) {
      if (product.getTitle == oldTitle) {
        product.setTitle = newTitle;
      }
    }
  }

  void editProuctDescription(
      {required String oldDescription, required String newDescription}) {
    for (Product product in products) {
      if (product.getDescription == oldDescription) {
        product.setDescription = newDescription;
      }
    }
  }

  void editProuctPrice({required num oldPrice, required num newPrice}) {
    for (Product product in products) {
      if (product.getPrice == oldPrice) {
        product.setPrice = newPrice;
      }
    }
  }

  void deleteProduct(String title) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].getTitle == title) {
        products.removeAt(i);
      }
    }
  }
}

void main() {
  ProductManager productManager = ProductManager(products: []);
  Product product1 =
      Product('biscuit', 'This is description for biscuit', 23.23);
  Product product2 = Product('shoe', 'This is description for shoe', 344.53);
  Product product3 = Product('car', 'This is description for car', 203.66);
  productManager.add(product1);
  productManager.add(product2);
  productManager.add(product3);
  productManager.editProuctDescription(
      oldDescription: 'This is description for biscuit',
      newDescription: "This is the new biscuit desctiption");
  print(productManager.viewAll());
  print(productManager.viewSingleProduct('biscuit'));
  productManager.deleteProduct('biscuit');
  productManager.deleteProduct('shoe');
  productManager.deleteProduct('car');
  productManager.viewAll();
}
