import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/di/injector_configurator.dart';
import 'controller/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => getIt<HomeBloc>(),
    child: Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Home'),
            ElevatedButton(
              onPressed: () => context.read<HomeBloc>().add(const HomeEvent.getCollections()),
              child: switch (state.fetchStatus) {
                CollectionsFetchStatus.initial => const Text('Get Collections'),
                CollectionsFetchStatus.success => const Text('Collections fetched'),
                CollectionsFetchStatus.failure => const Text('Failed to fetch collections'),
              },
            ),
          ],
        ),
      ),
    ),
  );
}
