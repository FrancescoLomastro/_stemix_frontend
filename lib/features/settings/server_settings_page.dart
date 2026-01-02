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
  final _formKey = GlobalKey<FormState>();

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
    if (_formKey.currentState!.validate()) {
      widget.settingsBloc.add(
        SaveServerSettingsEvent(
          ip: _ipController.text.trim(),
          port: _portController.text.trim(),
        ),
      );
      context.pop();
    }
  }

  String? _validateIpAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'IP address cannot be empty';
    }
    if (value.contains(' ')) {
      return 'IP address cannot contain spaces';
    }
    return null;
  }

  String? _validatePort(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Port cannot be empty';
    }
    if (value.contains(' ')) {
      return 'Port cannot contain spaces';
    }
    if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
      return 'Port must contain only numbers';
    }
    final port = int.tryParse(value.trim());
    if (port == null || port < 1 || port > 65535) {
      return 'Port must be between 1 and 65535';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Server Address")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
              TextFormField(
                controller: _ipController,
                decoration: const InputDecoration(
                  labelText: "IP Address",
                  border: OutlineInputBorder(),
                ),
                validator: _validateIpAddress,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _portController,
                decoration: const InputDecoration(
                  labelText: "Port",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: _validatePort,
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
      ),
    );
  }
}
