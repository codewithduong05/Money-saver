import 'package:save_money/src/data/local/app_database.dart';

class CategoryRepository {
  final AppDatabase db;
  CategoryRepository(this.db);

  Future<List<Category>> getAllExpense() {
    return (db.select(
      db.categories,
    )..where((c) => c.isExpense.equals(true))).get();
  }
}
