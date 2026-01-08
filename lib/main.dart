import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metadata_god/metadata_god.dart';
import 'package:stemix_frontend/deps_injection/injection.dart';
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart';
import 'package:stemix_frontend/router/app_router.dart';
import 'package:stemix_frontend/theme/theme.dart';
import 'package:stemix_frontend/theme/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MetadataGod.initialize();
  await configureDependencies();

  // =================================================================
  // 🛠️ ZONA MANUTENZIONE DATABASE 🛠️
  // Decommenta le funzioni che vuoi eseguire all'avvio dell'app.
  // =================================================================

  // await debugUpdateSong(1);      // <-- Modifica la canzone con ID 1
  // await debugDeleteSong(99);     // <-- Elimina la canzone con ID 99

  /* await debugDeleteAllSongs(); */

  /* for (int i = 0; i < 5; i++) {
    await debugCreateSong(
      title: "Canzone di Test #$i",
      artist: "Artista di Test",
      hasImage: i % 2 == 0,
      hasAudio: true,
    );
  } */
  /* await debugLogAllSongs(); */
  // =================================================================

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadBlocProvider = BlocProvider(create: (_) => getIt<UploadBloc>());

    //final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [uploadBlocProvider],
      child: MaterialApp.router(
        title: 'SteMix',
        theme: /*brightness == Brightness.light ? theme.light() : */ theme
            .dark(),
        routerConfig: appRouter,
      ),
    );
  }
}
