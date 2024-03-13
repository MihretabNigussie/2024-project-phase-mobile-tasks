class ShoeModel {
  final String name;
  final String imageURL;
  final String description;
  final num price;
  final String category;
  final num rating;

  ShoeModel(
      {required this.name,
      required this.imageURL,
      required this.description,
      required this.price,
      required this.category,
      required this.rating});

  static List<ShoeModel> shoes = [];

  void addShoe(ShoeModel shoe) {
    shoes.add(shoe);
  }

  // void updateShoe(ShoeModel beforeShoe, ShoeModel shoe) {
    
  //   shoes[index] = shoe;
  // }

  int getIndex(ShoeModel shoe) {
    return shoes.indexOf(shoe);
  }

  void deleteShoe(int index) {
    shoes.removeAt(index);
  }

  static ShoeModel getShoe(String? name) {
    return shoes.firstWhere((shoe) => shoe.name == name);
  }
}
