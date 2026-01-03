// domain/repository/category_repository.dart
import '../entity/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getAllCategories(String type);
}
