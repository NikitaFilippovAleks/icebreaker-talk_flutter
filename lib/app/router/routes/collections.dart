part of 'index.dart';

@immutable
class CollectionRoute extends GoRouteData with _$CollectionRoute {
  final int id;

  const CollectionRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) => CollectionScreen(id: id);
}
