part of 'bloc.dart';

@freezed
sealed class CollectionsListEvent with _$CollectionsListEvent {
  const factory CollectionsListEvent.getCollections() = _CollectionsListGetCollections;
}
