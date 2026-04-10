part of 'index.dart';

@immutable
class CollectionRoute extends GoRouteData with _$CollectionRoute {
  final String id;
  final String color;

  const CollectionRoute({required this.id, required this.color});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    CollectionAppearanceController().startTransition();
    return CustomTransitionPage(
      child: CollectionScreen(id: id, color: color),
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
