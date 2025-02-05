import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  int price;

  @HiveField(2)
  int cents;

  HiveModel({required this.name, required this.price, required this.cents});
}

