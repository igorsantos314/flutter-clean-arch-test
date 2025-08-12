import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_clean_arch_test/features/user/infra/local/user_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [UserEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          // Cria todas as tabelas definidas no banco de dados na primeira vez.
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Lógica para migrações futuras, se a schemaVersion mudar.
          // Exemplo: if (from < 2) { await m.alterTable(...); }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
