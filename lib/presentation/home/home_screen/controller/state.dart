part of 'bloc.dart';

enum CollectionsFetchStatus { initial, success, failure }

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required List<Collection> collections,
    required CollectionsFetchStatus fetchStatus,
  }) = _HomeState;

  factory HomeState.initial() =>
      const HomeState(collections: [], fetchStatus: CollectionsFetchStatus.initial);
}
