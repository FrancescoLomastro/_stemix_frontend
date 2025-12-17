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

import '../data/local/drift/database.dart' as _i34;
import '../data/local/repository/song_repository.dart' as _i992;
import '../features/library/bloc/library_bloc.dart' as _i62;
import '../features/upload/bloc/upload_bloc.dart' as _i530;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i530.UploadBloc>(() => _i530.UploadBloc());
    gh.lazySingleton<_i34.AppDatabase>(() => _i34.AppDatabase());
    gh.lazySingleton<_i992.SongRepository>(
      () => _i992.SongRepository(gh<_i34.AppDatabase>()),
    );
    gh.factory<_i62.LibraryBloc>(
      () => _i62.LibraryBloc(gh<_i992.SongRepository>()),
    );
    return this;
  }
}
