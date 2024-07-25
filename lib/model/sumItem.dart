import 'package:hive/hive.dart';

part 'sumItem.g.dart';

@HiveType(typeId: 0)
class SumItem extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final Map<String, double> productsMap;
  @HiveField(2)
  final Map<String, double> participantsMap;

  SumItem({
    required this.title,
    required this.productsMap,
    required this.participantsMap,
  });

  @override
  String toString() {
    return 'Product{title: $title, productsMap: $productsMap, participantsMap: $participantsMap}';
  }

/*
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'productsList': productsList,
    };
  }

  factory SumItem.fromMap(Map<String, dynamic> map) {
    return SumItem(
      title: map['title'] as String,
      productsList: map['productsList'] as Map<String, double>,
    );
  }
*/
}
