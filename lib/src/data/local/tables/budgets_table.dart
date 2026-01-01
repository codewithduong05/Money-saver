import 'package:drift/drift.dart';
import 'categories_table.dart';

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get limit => integer()();
  IntColumn get month => integer()(); // 202601
}
