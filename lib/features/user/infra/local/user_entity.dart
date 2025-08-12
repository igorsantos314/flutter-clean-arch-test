import 'package:drift/drift.dart';

@DataClassName('UserData')
class UserEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Coluna para o nome do usuário, não pode ser nulo.
  TextColumn get name => text()();

  // Coluna para o email do usuário, deve ser único e não pode ser nulo.
  TextColumn get email => text()();

  // Coluna para a idade do usuário, pode ser nula.
  IntColumn get age => integer()();

  // Coluna para indicar se o usuário é ativo, com valor padrão true.
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}