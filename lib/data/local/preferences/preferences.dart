import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  late final SharedPreferences _prefs;
  final _kIpKey = 'server_ip';
  final _kPortKey = 'server_port';

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String getServerIp() => _prefs.getString(_kIpKey) ?? '127.0.0.1';
  Future<void> setServerIp(String ip) => _prefs.setString(_kIpKey, ip);

  String getServerPort() => _prefs.getString(_kPortKey) ?? '8080';
  Future<void> setServerPort(String port) => _prefs.setString(_kPortKey, port);
}
