// domain/entity/category_entity.dart
class CategoryEntity {
  final int id;
  final String name;
  final int? parentId;
  final String type; // income | expense
  final String icon;
  final bool isActive;

  CategoryEntity({
    required this.id,
    required this.name,
    this.parentId,
    required this.type,
    required this.icon,
    required this.isActive,
  });
}
