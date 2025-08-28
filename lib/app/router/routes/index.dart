import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../presentation/collections/screens/collection/controller/bloc.dart';
import '../../../presentation/collections/screens/collection/index.dart';
import '../../../presentation/home/home_screen/index.dart';
import '../../di/injector_configurator.dart';

part 'home.dart';
part 'collections.dart';

part 'index.g.dart';

@TypedShellRoute<MainShell>(
  routes: [
    TypedGoRoute<HomeRoute>(
      path: '/',
      routes: [TypedGoRoute<CollectionRoute>(path: 'collections/:id')],
    ),
  ],
)
@immutable
class MainShell extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) => navigator;
}
