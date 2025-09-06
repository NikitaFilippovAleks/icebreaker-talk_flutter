import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/collection.dart';
import '../../../../../data/repositories/collections.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

typedef _Emitter = Emitter<AppState>;

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final CollectionsRepo _collectionsRepo;

  AppBloc({required CollectionsRepo collectionsRepo})
    : _collectionsRepo = collectionsRepo,
      super(AppState.initial()) {
    on<_AppInit>(_init);
  }

  Future<void> _init(_AppInit event, _Emitter emit) async {
    emit(state.copyWith(initStatus: AppInitStatus.initial));

    // Минимальная задержка 2 секунды
    const minDelay = Duration(seconds: 2);

    // Выполняем запрос данных и задержку параллельно
    final results = await Future.wait([
      _collectionsRepo.getCollections(),
      Future.delayed(minDelay),
    ]);

    final collections = results[0] as List<Collection>;
    emit(state.copyWith(collections: collections, initStatus: AppInitStatus.success));
  }
}
