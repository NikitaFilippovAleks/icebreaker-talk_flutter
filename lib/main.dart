import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/di/injector_configurator.dart';
import 'app/i18n/strings.g.dart';
import 'app/router/index.dart';
import 'app/theme/colors.dart';
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

  static const _maxWidth = 430.0;
  static const _maxHeight = 932.0;

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      // ScreenUtilInit использует View напрямую, игнорируя MediaQuery.
      // Переконфигурируем ScreenUtil с ограниченными размерами до того,
      // как lightSimpleTheme вычислит .sp значения.
      final view = View.of(context);
      final data = MediaQueryData.fromView(view);
      ScreenUtil.configure(
        data: data.copyWith(
          size: Size(
            data.size.width.clamp(0.0, _maxWidth),
            data.size.height.clamp(0.0, _maxHeight),
          ),
        ),
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
      );

      return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.initStatus != current.initStatus,
        builder: (context, state) => MaterialApp.router(
          theme: ThemeData(brightness: Brightness.light, extensions: [lightSimpleTheme]),
          darkTheme: ThemeData(brightness: Brightness.dark, extensions: [darkSimpleTheme]),
          themeMode: ThemeMode.light,
          locale: TranslationProvider.of(context).flutterLocale,
          routerConfig: getIt<AppRouter>().router,
          builder: (context, child) {
            final content =
                state.initStatus == AppInitStatus.success ? child! : const SplashScreen();

            return LayoutBuilder(
              builder: (context, constraints) {
                final isLargeScreen = constraints.maxWidth > _maxWidth ||
                    constraints.maxHeight > _maxHeight;
                final radius = isLargeScreen ? BorderRadius.circular(16) : BorderRadius.zero;

                return ColoredBox(
                  color: AppColors.backgroundDim,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: _maxWidth,
                        maxHeight: _maxHeight,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: radius,
                        boxShadow: isLargeScreen
                            ? [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.12),
                                  blurRadius: 32,
                                  spreadRadius: 2,
                                ),
                              ]
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: radius,
                        child: content,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}
