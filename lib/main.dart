import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';
import 'package:stemix_frontend/router/app_router.dart';

void main() {
  configureDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadBlocProvider = BlocProvider(create: (_) => getIt<UploadBloc>());

    return MultiBlocProvider(
      providers: [uploadBlocProvider],
      child: MaterialApp.router(title: 'SteMix', routerConfig: appRouter),
    );
  }
}
