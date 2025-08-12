import 'package:flutter_clean_arch_test/domain/common/error.dart';
import 'package:flutter_clean_arch_test/domain/common/outcome.dart';
import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';

abstract class UserRepository {
  Future<Outcome<int, AppError>> createUser(User user);
  Future<Outcome<bool, AppError>> updateUser(User user);
  Future<Outcome<bool, AppError>> deleteUser(String id);
  Future<Outcome<User?, AppError>> fetchUser(String id);
  Future<Outcome<Stream<List<User>>, AppError>> fetchAllUsers();
}