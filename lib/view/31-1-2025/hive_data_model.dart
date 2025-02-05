import 'package:hive/hive.dart';

part 'hive_data_model.g.dart';

@HiveType(typeId: 0)
class HiveDataModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  int price;

  @HiveField(2)
  int cents;

  HiveDataModel({required this.name, required this.price, required this.cents});
}
