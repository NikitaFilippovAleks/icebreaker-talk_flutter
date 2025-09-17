import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/widgets/loader/index.dart';
import '../../app/controller/bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(const AppEvent.init());
  }

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Loader()));
}
