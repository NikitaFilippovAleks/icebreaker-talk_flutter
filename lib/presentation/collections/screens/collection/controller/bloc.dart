import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/models/collection.dart';
import '../../../../../data/models/question.dart';
import '../../../../../data/repositories/collections.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

typedef _Emitter = Emitter<CollectionState>;

@injectable
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionsRepo _collectionsRepo;

  CollectionBloc({required CollectionsRepo collectionsRepo})
    : _collectionsRepo = collectionsRepo,
      super(CollectionState.initial()) {
    on<_CollectionGetCollection>(_getCollection);
    on<_CollectionChangeQuestion>(_changeQuestion);
  }

  Future<void> _getCollection(_CollectionGetCollection event, _Emitter emit) async {
    final collection = await _collectionsRepo.getCollection(event.id);
    emit(
      state.copyWith(
        collection: collection,
        status: CollectionStatus.success,
        currentQuestion: collection.questions.first,
        currentQuestionIndex: 0,
      ),
    );
  }

  void _changeQuestion(_CollectionChangeQuestion event, _Emitter emit) {
    final currentQuestion = state.currentQuestion;
    final currentQuestionIndex = state.collection!.questions.indexOf(currentQuestion!);

    if (event.changeQuestionType == ChangeQuestionType.next) {
      var nextQuestionIndex = currentQuestionIndex + 1;
      if (nextQuestionIndex >= state.collection!.questions.length) {
        nextQuestionIndex = 0;
      }
      final nextQuestion = state.collection!.questions[nextQuestionIndex];
      emit(state.copyWith(currentQuestion: nextQuestion, currentQuestionIndex: nextQuestionIndex));
    } else {
      var previousQuestionIndex = currentQuestionIndex - 1;
      if (previousQuestionIndex < 0) {
        previousQuestionIndex = state.collection!.questions.length - 1;
      }
      final previousQuestion = state.collection!.questions[previousQuestionIndex];
      emit(
        state.copyWith(
          currentQuestion: previousQuestion,
          currentQuestionIndex: previousQuestionIndex,
        ),
      );
    }
  }
}
