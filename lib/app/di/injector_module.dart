import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../env/env_config.dart';
import '../router/index.dart';

@module
abstract class InjectorModule {
  @singleton
  EnvConfig get envConfig => EnvConfig.fromJson(dotenv.env);

  @singleton
  Talker get talker => TalkerFlutter.init();

  @singleton
  AppRouter get router => AppRouter();

  @lazySingleton
  Dio dio(EnvConfig envConfig, Talker talker) {
    final loggerInterceptor = TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: true,
        printResponseHeaders: false,
        printResponseMessage: false,
        printErrorData: true,
        printErrorHeaders: true,
        printErrorMessage: false,
        printRequestData: true,
        printRequestHeaders: true,
      ),
    );

    final dio = Dio(
      BaseOptions(
        baseUrl: envConfig.apiUrl,
        connectTimeout: const Duration(seconds: 45),
        receiveTimeout: const Duration(seconds: 45),
        sendTimeout: const Duration(minutes: 5),
      ),
    )..interceptors.add(loggerInterceptor);

    return dio;
  }
}
