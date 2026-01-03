// lib/src/ui/viewmodel/category_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../../domain/usecase/get_category_tree_usecase.dart';

class CategoryViewModel extends ChangeNotifier {
  final GetCategoryTreeUseCase _getCategoryTree;

  CategoryViewModel(this._getCategoryTree);

  List<CategoryNode> _tree = [];
  List<CategoryNode> get tree => _tree;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadCategories(String type) async {
    _isLoading = true;
    notifyListeners();

    _tree = await _getCategoryTree(type);

    _isLoading = false;
    notifyListeners();
  }
}
