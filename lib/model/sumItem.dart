import 'package:hive/hive.dart';

part 'sumItem.g.dart';

@HiveType(typeId: 0)
class SumItem extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<Map<String, dynamic>> productsMap;
  @HiveField(2)
  final List<Map<String, dynamic>> participantsMap;
  @HiveField(3)
  final DateTime date;

  SumItem({
    required this.title,
    required this.productsMap,
    required this.participantsMap,
    required this.date,
  });

  @override
  String toString() {
    return 'Product{title: $title, productsMap: $productsMap, participantsMap: $participantsMap}';
  }
}
