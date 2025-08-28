part of 'index.dart';

class CollectionBody extends StatefulWidget {
  const CollectionBody({super.key, required this.id});

  final int id;

  @override
  State<CollectionBody> createState() => _CollectionBodyState();
}

class _CollectionBodyState extends State<CollectionBody> {
  @override
  void initState() {
    super.initState();
    context.read<CollectionBloc>().add(CollectionEvent.getCollection(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<CollectionBloc, CollectionState>(
            builder: (context, state) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CollectionHeader(
                  questionsCount: state.collection?.questions.length ?? 0,
                  currentQuestionNumber: state.currentQuestionIndex + 1,
                ),
                SizedBox(height: 50.h),
                Expanded(
                  child: GlassCard(
                    alpha: 0.3,
                    child: Center(
                      child: Text(
                        state.currentQuestion?.text ?? '',
                        style: theme.labelLargeMontserrat,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                const CollectionControls(),
                SizedBox(height: 58.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
