import 'package:flutter/material.dart';
import 'package:save_money/src/ui/screen/transaction/add_transaction_sheet.dart';
import 'package:save_money/src/ui/screen/budget/budget_screen.dart';
import 'package:save_money/src/ui/screen/profile/profile_screen.dart';
import 'package:save_money/src/ui/screen/report/report_screen.dart';
import 'homescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(), // Trang chủ
    BudgetScreen(), // Ngân sách
    SizedBox(), // placeholder cho nút +
    ReportScreen(), // Thống kê
    ProfileScreen(), // Cá nhân
  ];

  void _onTap(int index) {
    if (index == 2) {
      _openAddTransaction();
      return;
    }
    setState(() => _currentIndex = index);
  }

  void _openAddTransaction() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddTransactionSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Ngân sách',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 36),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Thống kê',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài Khoản'),
        ],
      ),
    );
  }
}
