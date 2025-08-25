import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import '../env/env_config.dart';

@module
abstract class InjectorModule {
  @singleton
  EnvConfig get envConfig => EnvConfig.fromJson(dotenv.env);

  // @singleton
  // AppRouter get router => AppRouter();

  @lazySingleton
  Dio dio(EnvConfig envConfig) => Dio(
    BaseOptions(
      baseUrl: envConfig.apiUrl,
      connectTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 45),
      sendTimeout: const Duration(minutes: 5),
    ),
  );
}
