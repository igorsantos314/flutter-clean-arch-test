import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';

abstract class UserRepository {
  Future<User> fetchUser(String id);
}