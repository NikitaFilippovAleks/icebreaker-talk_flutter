import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../app/db/database.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
abstract class Question with _$Question {
  const Question._();

  const factory Question({required int id, required String text}) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

  QuestionsTableCompanion toTableCompanion(int collectionId) => QuestionsTableCompanion(
    id: drift.Value(id),
    questionText: drift.Value(text),
    collectionId: drift.Value(collectionId),
  );

  factory Question.fromTableCompanion(QuestionsTableCompanion companion) =>
      Question(id: companion.id.value, text: companion.questionText.value);
}
