part of 'index.dart';

@immutable
class CollectionRoute extends GoRouteData with _$CollectionRoute {
  final int id;

  const CollectionRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    CollectionAppearanceController().startTransition();
    return CustomTransitionPage(
      child: CollectionScreen(id: id),
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (animation.isCompleted) {
          CollectionAppearanceController().endTransition();
        }
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(animation),
          child: child,
        );
      },
    );
  }
}
