import 'package:codepiraten/data/data_sources/advice_data_source_rest_api.dart';
import 'package:codepiraten/data/repository/advice_repo_rest_api.dart';
import 'package:codepiraten/domain/repositories/advice_repo.dart';
import 'package:codepiraten/injection.dart' as di;
import 'package:codepiraten/presentation/advice_page/advice_page.dart';
import 'package:codepiraten/presentation/core/dart_define.dart';
import 'package:codepiraten/presentation/core/theme_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String mandant = const String.fromEnvironment(DartDefine.mandant, defaultValue: 'codepiraten');

  debugPrint('Mandant: $mandant');
  final castedMandant = Mandant.fromEnv(mandant);

  await EasyLocalization.ensureInitialized();

  await di.init(mandant: castedMandant);

  final client = http.Client();
  final dataSource = AdviceDataSourceRestApi(client: client);

  runApp(EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      startLocale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: RepositoryProvider<AdviceRepo>(
          create: (context) => AdviceRepoRestApi(dataSource: dataSource),
          child: ChangeNotifierProvider(create: (context) => di.getIt<ThemeService>(), child: const MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      child: const AdvicePageProvider(),
      builder: (context, value, child) {
        final brightness = value.isDarkMode ? Brightness.dark : Brightness.light;
        return MaterialApp(
            title: 'Flutter Demo',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: value.baseColor, brightness: brightness),
              brightness: brightness,
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                    title: const Text('Flutter Demo Home Page'),
                    actions: [IconButton(onPressed: () => value.switchTheme(), icon: const Icon(Icons.brightness_4))]),
                body: SafeArea(child: Center(child: child))));
      },
    );
  }
}

// folder
//     max
//     codepiraten
