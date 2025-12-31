import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/preferences/preferences.dart';

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<PreferencesService> get preferencesService async {
    final service = PreferencesService();
    await service.init();
    return service;
  }
}
