import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.g.dart';
part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  // ignore: invalid_annotation_target
  @JsonSerializable()
  const factory Question({required int id, required String text}) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);
}
