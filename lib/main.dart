import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/di/injector_configurator.dart';
import 'app/i18n/strings.g.dart';
import 'app/router/index.dart';
import 'app/theme/theme.dart';
import 'presentation/app/controller/bloc.dart';
import 'presentation/splash/splash_screen/index.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await configureDependencies();
  runApp(
    TranslationProvider(
      child: BlocProvider(create: (context) => getIt<AppBloc>(), child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.initStatus != current.initStatus,
      builder: (context, state) => MaterialApp.router(
        theme: ThemeData(brightness: Brightness.light, extensions: [lightSimpleTheme]),
        darkTheme: ThemeData(brightness: Brightness.dark, extensions: [darkSimpleTheme]),
        themeMode: ThemeMode.light,
        locale: TranslationProvider.of(context).flutterLocale,
        routerConfig: getIt<AppRouter>().router,
        builder: (context, child) {
          if (state.initStatus == AppInitStatus.success) {
            return child!;
          }

          return const SplashScreen();
        },
      ),
    ),
  );
}
