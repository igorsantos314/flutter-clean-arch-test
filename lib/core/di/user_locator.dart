import 'package:flutter_clean_arch_test/core/di/app_locator.dart';
import 'package:flutter_clean_arch_test/features/user/data/repository/user_repository_impl.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';

void initUserLocator() {
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
}