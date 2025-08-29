part of 'index.dart';

class CollectionHeader extends StatelessWidget {
  const CollectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedAppearance(child: ButtonsBack(onPressed: () => context.pop())),
        BlocBuilder<CollectionBloc, CollectionState>(
          builder: (context, state) {
            if (state.collection == null || state.currentQuestion == null) {
              return const SizedBox.shrink();
            }

            final currentQuestionNumber = state.currentQuestionIndex + 1;
            final questionsCount = state.collection!.questions.length;

            return AnimatedAppearance(
              child: Container(
                decoration: BoxDecoration(
                  color: context.customTheme.black,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                child: Text(
                  '$currentQuestionNumber / $questionsCount',
                  style: theme.bodyMediumMontserrat.copyWith(color: theme.white),
                ),
              ),
            );
          },
        ),
        SizedBox(width: 36.w),
      ],
    );
  }
}
