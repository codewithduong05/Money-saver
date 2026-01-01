import 'package:drift/drift.dart';

class Wallets extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  RealColumn get balance => real()();

  @override
  Set<Column> get primaryKey => {id};
}
