import 'package:drift/drift.dart';

import '../collection/collections_table.dart';

class QuestionsTable extends Table {
  IntColumn get id => integer()();
  TextColumn get questionText => text()();
  IntColumn get collectionId => integer().references(CollectionsTable, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
