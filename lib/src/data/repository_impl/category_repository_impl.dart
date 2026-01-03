// lib/src/data/repository_impl/category_repository_impl.dart

import 'package:drift/drift.dart';

import '../../domain/entity/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../local/app_database.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final AppDatabase db;

  CategoryRepositoryImpl(this.db);

  @override
  Future<List<CategoryEntity>> getAllCategories(String type) async {
    final query = db.select(db.categories)
      ..where((tbl) => tbl.type.equals(type) & tbl.isActive.equals(true));

    final rows = await query.get();

    return rows
        .map(
          (row) => CategoryEntity(
            id: row.id,
            name: row.name,
            parentId: row.parentId,
            type: row.type,
            icon: row.icon,
            isActive: row.isActive,
          ),
        )
        .toList();
  }
}
