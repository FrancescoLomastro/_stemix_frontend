// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:stemix_frontend/data/local/drift/database.dart' as _i249;
import 'package:stemix_frontend/data/local/preferences/preferences.dart'
    as _i198;
import 'package:stemix_frontend/data/local/repository/song_repository.dart'
    as _i1053;
import 'package:stemix_frontend/deps_injection/register_module.dart' as _i289;
import 'package:stemix_frontend/features/library/bloc/library_bloc.dart'
    as _i62;
import 'package:stemix_frontend/features/player/audio/soloud_audio.dart'
    as _i681;
import 'package:stemix_frontend/features/player/bloc/player_bloc.dart' as _i528;
import 'package:stemix_frontend/features/settings/bloc/settings_bloc.dart'
    as _i178;
import 'package:stemix_frontend/features/upload/bloc/upload_bloc.dart' as _i656;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i656.UploadBloc>(() => _i656.UploadBloc());
    await gh.singletonAsync<_i198.PreferencesService>(
      () => registerModule.preferencesService,
      preResolve: true,
    );
    gh.lazySingleton<_i249.AppDatabase>(() => _i249.AppDatabase());
    gh.lazySingleton<_i681.SoloudImplementation>(
      () => _i681.SoloudImplementation(),
    );
    gh.factory<_i178.SettingsBloc>(
      () => _i178.SettingsBloc(gh<_i198.PreferencesService>()),
    );
    gh.lazySingleton<_i1053.SongRepository>(
      () => _i1053.SongRepository(gh<_i249.AppDatabase>()),
    );
    gh.factoryParam<_i528.PlayerBloc, _i249.Song, dynamic>(
      (_song, _) => _i528.PlayerBloc(
        gh<_i681.SoloudImplementation>(),
        gh<_i1053.SongRepository>(),
        _song,
      ),
    );
    gh.factory<_i62.LibraryBloc>(
      () => _i62.LibraryBloc(gh<_i1053.SongRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i289.RegisterModule {}
