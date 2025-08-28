part of 'bloc.dart';

enum CollectionStatus { initial, success, failure }

@freezed
sealed class CollectionState with _$CollectionState {
  const factory CollectionState({
    Collection? collection,
    required CollectionStatus status,
    Question? currentQuestion,
    required int currentQuestionIndex,
  }) = _CollectionState;

  factory CollectionState.initial() => const CollectionState(
    collection: null,
    status: CollectionStatus.initial,
    currentQuestion: null,
    currentQuestionIndex: 0,
  );
}
