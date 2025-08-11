import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';
import 'package:flutter_clean_arch_test/features/user/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<User> fetchUser(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    // Lógica de busca de usuário simulada
    if (id == '123') {
      return const User(id: '123', name: 'Alice', email: 'alice@example.com');
    } else {
      throw Exception('Usuário não encontrado!');
    }
  }
}