import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/db/database.dart';
import '../question/question.dart';

part 'collection.freezed.dart';
part 'collection.g.dart';

@freezed
abstract class Collection with _$Collection {
  const Collection._();

  const factory Collection({
    required int id,
    required String name,
    String? description,
    required String color,
    required List<Question> questions,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);

  CollectionsTableCompanion toTableCompanion() => CollectionsTableCompanion(
    id: drift.Value(id),
    name: drift.Value(name),
    description: drift.Value(description ?? ''),
    color: drift.Value(color),
  );

  factory Collection.fromTableCompanion(
    CollectionsTableCompanion companion, [
    List<Question> questions = const [],
  ]) => Collection(
    id: companion.id.value,
    name: companion.name.value,
    description: companion.description.value,
    color: companion.color.value,
    questions: questions,
  );
}
