part of 'bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getCollections() = _HomeGetCollections;
}
