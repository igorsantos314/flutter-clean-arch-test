import 'package:drift/drift.dart';
import 'package:flutter_clean_arch_test/core/database/database.dart';
import 'package:flutter_clean_arch_test/features/user/domain/model/user.dart';

class UserMapper {
  static User fromUserData(UserData userData) {
    return User(
      id: userData.id, // Converte int do DB para String do domínio
      name: userData.name,
      email: userData.email,
      age: userData.age, // int? já é compatível
      isActive: userData.isActive, // Mapeia 'isActive' do DB para 'isStudent' do domínio
    );
  }

  static UserData toUserData(User user) {
    return UserData(
      id: user.id ?? 0,
      name: user.name,
      email: user.email,
      age: user.age,
      isActive: user.isActive
    );
  }

  static UserEntityCompanion toUserEntityCompanion(User user) {
    return UserEntityCompanion(
      id: user.id != null ? Value(user.id!) : const Value.absent(),
      name: Value(user.name),
      email: Value(user.email),
      // <-- MUDANÇA: age no DB não é nullable, então precisamos fornecer um int.
      // Assumindo 0 como padrão se user.age for null no domínio.
      age: Value(user.age),
      isActive: Value(user.isActive), // Mapeia 'isStudent' do domínio para 'isActive' do DB
    );
  }
}