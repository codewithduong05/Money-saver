import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../local/app_database.dart';

class TransactionRepository {
  final AppDatabase db;
  TransactionRepository(this.db);

  Future<void> addExpense(double amount, String note) async {
    await db
        .into(db.transactions)
        .insert(
          TransactionsCompanion.insert(
            id: const Uuid().v4(),
            amount: amount,
            type: 'expense',
            note: Value(note),
            createdAt: DateTime.now(),
          ),
        );
  }

  Future<List<Transaction>> getAll() {
    return db.select(db.transactions).get();
  }
}
