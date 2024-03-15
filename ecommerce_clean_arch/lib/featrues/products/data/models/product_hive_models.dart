import 'package:hive/hive.dart';

// part 'producthivemodel.g.dart';

@HiveType(typeId: 0)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late num price;

  ProductHiveModel({
    required this.name,
    required this.id,
    required this.description,
    required this.price,
  });
}
