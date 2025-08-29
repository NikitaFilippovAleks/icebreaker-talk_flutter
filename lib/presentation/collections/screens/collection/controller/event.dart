part of 'bloc.dart';

enum ChangeQuestionType { next, previous }

@freezed
sealed class CollectionEvent with _$CollectionEvent {
  const factory CollectionEvent.getCollection(int id) = _CollectionGetCollection;
  const factory CollectionEvent.changeQuestion(ChangeQuestionType changeQuestionType) =
      _CollectionChangeQuestion;
}
