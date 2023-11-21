import 'package:codepiraten/presentation/core/theme_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future<void> init({required Mandant mandant}) async {
  getIt.registerFactory(() => ThemeService(mandant: mandant));
}