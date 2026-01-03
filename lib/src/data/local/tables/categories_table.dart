// src/data/local/tables/categories.dart
import 'package:drift/drift.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()(); // khoa chinh san pha
  TextColumn get name => text()(); // ten nhom
  IntColumn get parentId => integer().nullable()(); // id nhom cha
  TextColumn get type => text()(); // expense | income ( chi hay thu)
  TextColumn get icon => text()(); // icon path
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}
