// repository/transaction_repository.dart
import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../local/app_database.dart';

class TransactionRepository {
  final AppDatabase db;
  TransactionRepository(this.db);

  Future<void> addExpense({
    required int amount,
    required int categoryId,
    String? note,
  }) async {
    await db
        .into(db.transactions)
        .insert(
          TransactionsCompanion.insert(
            amount: amount,
            isExpense: true,
            categoryId: categoryId,
            note: Value(note),
            createdAt: DateTime.now(),
          ),
        );

    print(db);
  }

  Future<void> addIncome({
    required int amount,
    required int categoryId,
    String? note,
  }) async {
    await db
        .into(db.transactions)
        .insert(
          TransactionsCompanion.insert(
            amount: amount,
            isExpense: false,
            categoryId: categoryId,
            note: Value(note),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<List<Transaction>> getAll() {
    return db.select(db.transactions).get();
  }
}
