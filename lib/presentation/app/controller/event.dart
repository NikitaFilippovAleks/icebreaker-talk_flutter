part of 'bloc.dart';

@freezed
sealed class AppEvent with _$AppEvent {
  const factory AppEvent.init() = _AppInit;
  const factory AppEvent.refresh(Completer<void> completer) = _AppRefresh;
}
