import 'package:hive/hive.dart';

import 'package:sum_calculator/model/sumItem.dart';

class Boxes {
  static Box<SumItem> getSumItems() => Hive.box<SumItem>('sumItem');
}
