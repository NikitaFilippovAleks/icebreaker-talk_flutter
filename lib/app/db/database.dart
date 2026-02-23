import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../data/models/collection/collections_table.dart';
import '../../data/models/question/questions_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [CollectionsTable, QuestionsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
  );

  static QueryExecutor _openConnection() => driftDatabase(name: 'app_database');
}
