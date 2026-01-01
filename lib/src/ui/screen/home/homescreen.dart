import 'package:flutter/material.dart';
import '../../../data/local/app_database.dart';
import '../../../data/repository/transaction_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AppDatabase db;
  late final TransactionRepository repo;

  List<Transaction> items = [];

  @override
  void initState() {
    super.initState();
    db = AppDatabase();
    repo = TransactionRepository(db);
    // _load();
  }

  // Future<void> _load() async {
  //   final data = await repo.getAll();
  //   setState(() => items = data);
  // }

  // Future<void> _add() async {
  //   await repo.addExpense(50000, 'Ăn sáng');
  //   _load();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save Money'), centerTitle: true),

      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (_, i) {
      //     final t = items[i];
      //     return ListTile(
      //       title: Text('${t.amount}'),
      //       subtitle: Text(t.note ?? ''),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _add,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
