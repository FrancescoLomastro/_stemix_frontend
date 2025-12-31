part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  final String serverIp;
  final String serverPort;

  const SettingsState({this.serverIp = '', this.serverPort = ''});

  SettingsState copyWith({String? serverIp, String? serverPort}) {
    return SettingsState(
      serverIp: serverIp ?? this.serverIp,
      serverPort: serverPort ?? this.serverPort,
    );
  }

  @override
  List<Object?> get props => [serverIp, serverPort];
}
