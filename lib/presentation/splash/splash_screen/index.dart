import 'package:flutter/material.dart';

import '../../../shared/widgets/loader/index.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Loader()));
}
