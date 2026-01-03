// lib/main.dart
import 'package:flutter/material.dart';
import 'package:save_money/src/injector.dart';
import 'package:save_money/src/ui/screen/home/main_screen.dart';
// import 'package:riverpod/riverpod.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // MyApp();
  // // runApp(
  // //   child : const MyApp(),
  // // );
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}
