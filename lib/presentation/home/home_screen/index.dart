import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector_configurator.dart';
import '../../collections/widgets/collections_list/controller/bloc.dart';
import '../../collections/widgets/collections_list/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => getIt<CollectionsListBloc>(),
    child: const Scaffold(body: CollectionsList()),
  );
}
