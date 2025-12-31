part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object> get props => [];
}

class LoadSettingsEvent extends SettingsEvent {}

class SaveServerSettingsEvent extends SettingsEvent {
  final String ip;
  final String port;

  const SaveServerSettingsEvent({required this.ip, required this.port});

  @override
  List<Object> get props => [ip, port];
}
