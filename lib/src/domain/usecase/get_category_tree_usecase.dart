// src/domain/usecase/get_category_tree_usecase.dart

import '../entity/category_entity.dart';
import '../repository/category_repository.dart';

class CategoryNode {
  final CategoryEntity parent;
  final List<CategoryEntity> children;

  CategoryNode({required this.parent, required this.children});
}

class GetCategoryTreeUseCase {
  final CategoryRepository repository;

  GetCategoryTreeUseCase(this.repository);

  Future<List<CategoryNode>> call(String type) async {
    final all = await repository.getAllCategories(type);

    final parents = all.where((c) => c.parentId == null).toList();

    return parents.map((parent) {
      final children = all.where((c) => c.parentId == parent.id).toList();
      return CategoryNode(parent: parent, children: children);
    }).toList();
  }
}
