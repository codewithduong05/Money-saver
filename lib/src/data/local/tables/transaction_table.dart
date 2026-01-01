import 'package:drift/drift.dart';
import 'categories_table.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get amount => integer()();
  BoolColumn get isExpense => boolean()(); // true = chi, false = thu
  TextColumn get note => text().nullable()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
