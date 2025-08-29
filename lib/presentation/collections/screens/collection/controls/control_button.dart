part of 'index.dart';

enum ControlButtonVariant { left, right }

class ControlButton extends StatelessWidget {
  const ControlButton({super.key, required this.variant});

  final ControlButtonVariant variant;

  @override
  Widget build(BuildContext context) => ButtonsGlass(
    onPressed: () => context.read<CollectionBloc>().add(
      CollectionEvent.changeQuestion(
        variant == ControlButtonVariant.left
            ? ChangeQuestionType.previous
            : ChangeQuestionType.next,
      ),
    ),
    variant: ButtonsGlassVariant.square,
    padding: EdgeInsets.all(12.r),
    borderRadius: 16.r,
    child: Transform.rotate(
      angle: variant == ControlButtonVariant.left ? 0 : pi,
      child: Assets.icons.arrowInSquare.svg(),
    ),
  );
}
