import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/data/local/preferences/preferences.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final PreferencesService _preferences;

  SettingsBloc(this._preferences) : super(const SettingsState()) {
    on<LoadSettingsEvent>(_onLoadSettings);
    on<SaveServerSettingsEvent>(_onSaveServerSettings);
  }

  void _onLoadSettings(LoadSettingsEvent event, Emitter<SettingsState> emit) {
    final ip = _preferences.getServerIp();
    final port = _preferences.getServerPort();
    emit(state.copyWith(serverIp: ip, serverPort: port));
  }

  Future<void> _onSaveServerSettings(
    SaveServerSettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _preferences.setServerIp(event.ip);
    await _preferences.setServerPort(event.port);
    emit(state.copyWith(serverIp: event.ip, serverPort: event.port));
  }
}
