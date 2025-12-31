import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PreferencesService {
  static const _kIpKey = 'server_ip';
  static const _kPortKey = 'server_port';

  Future<void> saveConnectionSettings(String ip, String port) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kIpKey, ip);
    await prefs.setString(_kPortKey, port);
  }

  Future<(String, String)> getConnectionSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return (
      prefs.getString(_kIpKey) ?? '127.0.0.1',
      prefs.getString(_kPortKey) ?? '8080',
    );
  }
}
