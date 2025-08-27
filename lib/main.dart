import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/di/injector_configurator.dart';
import 'app/theme/theme.dart';
import 'presentation/home/home_screen/index.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => MaterialApp(
      theme: ThemeData(brightness: Brightness.light, extensions: [lightSimpleTheme]),
      darkTheme: ThemeData(brightness: Brightness.dark, extensions: [darkSimpleTheme]),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    ),
  );
}
