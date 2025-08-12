import 'package:flutter_clean_arch_test/core/database/database.dart';
import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/features/user/data/repository/user_repository_impl.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';
import 'package:flutter_clean_arch_test/features/user/infra/local/user_dao.dart';

void initUserLocator() {
  /// Register Data Sources or DAOs
  getIt.registerSingleton<UserDao>(
    UserDao(
      getIt.get<AppDatabase>(),
    )
  );

  /// Register Repositories
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      getIt.get<UserDao>(), // Injecting UserDao into UserRepositoryImpl
    )
  );
}