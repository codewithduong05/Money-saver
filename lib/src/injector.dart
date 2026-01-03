import 'package:get_it/get_it.dart';
import 'package:save_money/src/data/local/app_database.dart';
import 'package:save_money/src/data/repository/category_repository.dart';
import 'package:save_money/src/domain/usecase/get_category_tree_usecase.dart';
import 'package:save_money/src/data/repository_impl/category_repository_impl.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton(() => AppDatabase());

  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton(() => GetCategoryTreeUseCase(getIt()));
}
