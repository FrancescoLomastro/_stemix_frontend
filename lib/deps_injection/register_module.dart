import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/preferences/preferences.dart';
import 'package:dio/dio.dart';

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<PreferencesService> get preferencesService async {
    final service = PreferencesService();
    await service.init();
    return service;
  }

  /// Provides a single Dio instance with long timeouts.
  /// The baseUrl is resolved per-request from PreferencesService
  /// so that user-changed IP/port are always used.
  @lazySingleton
  Dio dio(PreferencesService prefs) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 160),
        receiveTimeout: const Duration(seconds: 520),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final ip = prefs.getServerIp();
          final port = prefs.getServerPort();
          final base = 'http://$ip:$port';

          // Apply baseUrl only if caller did not set a full URL.
          if (!(options.path.startsWith('http://') ||
              options.path.startsWith('https://'))) {
            options.baseUrl = base;
          }

          return handler.next(options);
        },
      ),
    );

    return dio;
  }
}
