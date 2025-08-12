import 'package:drift/drift.dart';
import 'package:flutter_clean_arch_test/core/database/database.dart';
import 'package:flutter_clean_arch_test/features/user/infra/local/user_entity.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [UserEntity])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  final AppDatabase db; // Referência ao banco de dados

  UserDao(this.db) : super(db); // Construtor que recebe a instância do banco de dados

  // --- Operações CREATE ---

  // Insere um novo usuário no banco de dados.
  // `UsersCompanion` é uma classe gerada pelo Drift para inserir/atualizar dados.
  Future<int> createUser(UserEntityCompanion entry) {
    return db.into(db.userEntity).insert(entry);
  }

  // --- Operações READ ---

  // Obtém todos os usuários do banco de dados.
  Stream<List<UserData>> getAllUsers() {
    // Retorna um Stream que emite uma nova lista de usuários
    // toda vez que a tabela 'users' é modificada.
    return db.select(db.userEntity).watch();
  }

  // Obtém um usuário pelo ID.
  Future<UserData?> getUserById(int id) {
    return (db.select(db.userEntity)..where((u) => u.id.equals(id))).getSingleOrNull();
  }

  // --- Operações UPDATE ---

  // Atualiza um usuário existente.
  // Retorna true se o usuário foi atualizado com sucesso, false caso contrário.
  Future<bool> updateUser(UserEntityCompanion user) {
    return db.update(db.userEntity).replace(user);
  }

  // --- Operações DELETE ---

  // Deleta um usuário pelo ID.
  Future<int> deleteUser(int id) {
    return (db.delete(db.userEntity)..where((u) => u.id.equals(id))).go();
  }
}