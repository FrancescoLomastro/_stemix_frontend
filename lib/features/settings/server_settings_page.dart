import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stemix_frontend/features/settings/bloc/settings_bloc.dart';

class ServerSettingsPage extends StatefulWidget {
  final SettingsBloc settingsBloc;

  const ServerSettingsPage({super.key, required this.settingsBloc});

  @override
  State<ServerSettingsPage> createState() => _ServerSettingsPageState();
}

class _ServerSettingsPageState extends State<ServerSettingsPage> {
  late TextEditingController _ipController;
  late TextEditingController _portController;

  @override
  void initState() {
    super.initState();
    final state = widget.settingsBloc.state;
    _ipController = TextEditingController(text: state.serverIp);
    _portController = TextEditingController(text: state.serverPort);
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }

  void _save() {
    widget.settingsBloc.add(
      SaveServerSettingsEvent(
        ip: _ipController.text,
        port: _portController.text,
      ),
    );
    context.pop(); // Torna indietro
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Server Address")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This form allows to set the server IP address and port. "
              "This address is used to connect to the backend server. Responsible of producing stems.",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _ipController,
              decoration: const InputDecoration(
                labelText: "IP Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _portController,
              decoration: const InputDecoration(
                labelText: "Port",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: _save,
                    child: const Text("Salva"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
