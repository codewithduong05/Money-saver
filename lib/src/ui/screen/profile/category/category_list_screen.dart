// src/ui/screen/category/category_list_screen.dart
import 'package:flutter/material.dart';
import 'package:save_money/src/ui/viewmodel/category_viewmodel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CategoryViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Nhóm"),
        centerTitle: true,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.tree.length,
              itemBuilder: (context, index) {
                final node = viewModel.tree[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nhóm CHA
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        node.parent.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    // Nhóm CON
                    ...node.children.map(
                      (child) => ListTile(
                        leading: const Icon(Icons.circle, size: 10),
                        title: Text(child.name),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // chọn category con
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
