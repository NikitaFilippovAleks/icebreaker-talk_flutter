part of 'index.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  void _onSwipe() {
    context.read<CollectionBloc>().add(
      const CollectionEvent.changeQuestion(ChangeQuestionType.next),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      BlocBuilder<CollectionBloc, CollectionState>(
        builder: (context, state) => Expanded(
          child: CardSwiper(
            onSwipe: (prevIndex, currentIndex, direction) {
              _onSwipe();
              return true;
            },
            padding: EdgeInsets.zero,
            numberOfCardsDisplayed: 1,
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
                QuestionCard(questionText: state.currentQuestion?.text),
            cardsCount: state.collection!.questions.length,
          ),
        ),
      ),
      SizedBox(height: 24.h),
      const CollectionControls(),
    ],
  );
}
