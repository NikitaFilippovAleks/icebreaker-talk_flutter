part of 'bloc.dart';

enum AppInitStatus { initial, success, failure }

@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    required List<Collection> collections,
    required AppInitStatus initStatus,
  }) = _AppState;

  factory AppState.initial() => const AppState(collections: [], initStatus: AppInitStatus.initial);
}
