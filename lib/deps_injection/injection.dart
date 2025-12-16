import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stemix_frontend/deps_injection/injection.config.dart';

///Define the global access to GetIt
final getIt = GetIt.instance;

/// Look at them as two separate things:
///
/// 1. The annotation tells the generator to generate the code
///    to initialize the dependencies.
///    It generates the "init()" method on the getIt instance
///    [At build time]
///
/// 2. The function that calls the "init()" method
///    [At runtime]
///
/// Comando per generare il file injection.config.dart:
/// flutter pub run build_runner build --delete-conflicting-outputs
///
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
