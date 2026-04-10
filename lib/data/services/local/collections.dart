import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../app/db/database.dart';
import '../../models/collection/collection.dart';
import '../../models/question/question.dart';

@injectable
class CollectionsLocal {
  final AppDatabase _database;

  CollectionsLocal(this._database);

  Future<List<Collection>> getCollections() async {
    final collections = await _database.select(_database.collectionsTable).get();

    final List<Collection> result = [];

    for (final collection in collections) {
      final questions = await (_database.select(
        _database.questionsTable,
      )..where((q) => q.collectionId.equals(collection.id))).get();

      final questionModels = questions
          .map((q) => Question(id: q.id, text: q.questionText))
          .toList();

      final companion = CollectionsTableCompanion(
        id: Value(collection.id),
        name: Value(collection.name),
        description: Value(collection.description),
        color: Value(collection.color),
      );

      result.add(Collection.fromTableCompanion(companion, questionModels));
    }

    return result;
  }

  Future<Collection> getCollection(String id) async {
    final collection = await (_database.select(
      _database.collectionsTable,
    )..where((c) => c.id.equals(id))).getSingle();

    final questions = await (_database.select(
      _database.questionsTable,
    )..where((q) => q.collectionId.equals(id))).get();

    final questionModels = questions.map((q) => Question(id: q.id, text: q.questionText)).toList();

    final companion = CollectionsTableCompanion(
      id: Value(collection.id),
      name: Value(collection.name),
      description: Value(collection.description),
      color: Value(collection.color),
    );

    return Collection.fromTableCompanion(companion, questionModels);
  }

  Future<void> saveCollection(Collection collection) async {
    await _database
        .into(_database.collectionsTable)
        .insert(collection.toTableCompanion(), mode: InsertMode.insertOrReplace);

    // Сохраняем вопросы
    for (final question in collection.questions) {
      await _database
          .into(_database.questionsTable)
          .insert(question.toTableCompanion(collection.id), mode: InsertMode.insertOrReplace);
    }
  }

  Future<void> saveCollections(List<Collection> collections) async {
    for (final collection in collections) {
      await saveCollection(collection);
    }
  }

  Future<void> replaceAllCollections(List<Collection> collections) async {
    await _database.delete(_database.questionsTable).go();
    await _database.delete(_database.collectionsTable).go();
    await saveCollections(collections);
  }
}
