part of 'bloc.dart';

enum CollectionsFetchStatus { initial, success, failure }

@freezed
sealed class CollectionsListState with _$CollectionsListState {
  const factory CollectionsListState({
    required List<Collection> collections,
    required CollectionsFetchStatus fetchStatus,
  }) = _CollectionsListState;

  factory CollectionsListState.initial() =>
      const CollectionsListState(collections: [], fetchStatus: CollectionsFetchStatus.initial);
}
