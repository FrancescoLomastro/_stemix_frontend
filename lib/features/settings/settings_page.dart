import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/settings/bloc/settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsBloc>()..add(LoadSettingsEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          title: const Text("Settings"),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return ListView(
              children: [
                ListTile(
                  title: Text(
                    "Server Address",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    "${state.serverIp}:${state.serverPort}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push(
                      '/server-settings',
                      extra: context.read<SettingsBloc>(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
