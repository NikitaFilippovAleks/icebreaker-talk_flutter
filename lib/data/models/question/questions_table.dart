import 'package:drift/drift.dart';

import '../collection/collections_table.dart';

class QuestionsTable extends Table {
  TextColumn get id => text()();
  TextColumn get questionText => text()();
  TextColumn get collectionId => text().references(CollectionsTable, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
