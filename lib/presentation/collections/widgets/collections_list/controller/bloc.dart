import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/collection.dart';
import '../../../../../data/repositories/collections.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

typedef _Emitter = Emitter<CollectionsListState>;

@injectable
class CollectionsListBloc extends Bloc<CollectionsListEvent, CollectionsListState> {
  final CollectionsRepo _collectionsRepo;

  CollectionsListBloc({required CollectionsRepo collectionsRepo})
    : _collectionsRepo = collectionsRepo,
      super(CollectionsListState.initial()) {
    on<_CollectionsListGetCollections>(_getCollections);
  }

  Future<void> _getCollections(_CollectionsListGetCollections event, _Emitter emit) async {
    emit(state.copyWith(fetchStatus: CollectionsFetchStatus.initial));
    final collections = await _collectionsRepo.getCollections();
    emit(state.copyWith(collections: collections, fetchStatus: CollectionsFetchStatus.success));
  }
}
