import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/collection.dart';
import '../../../../data/repositories/collections.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

typedef _Emitter = Emitter<HomeState>;

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CollectionsRepo _collectionsRepo;

  HomeBloc({required CollectionsRepo collectionsRepo})
    : _collectionsRepo = collectionsRepo,
      super(HomeState.initial()) {
    on<_HomeGetCollections>(_getCollections);
  }

  Future<void> _getCollections(_HomeGetCollections event, _Emitter emit) async {
    emit(state.copyWith(fetchStatus: CollectionsFetchStatus.initial));
    final collections = await _collectionsRepo.getCollections();
    emit(state.copyWith(collections: collections, fetchStatus: CollectionsFetchStatus.success));
  }
}
