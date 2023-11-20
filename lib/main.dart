import 'package:codepiraten/data/data_sources/advice_data_source_rest_api.dart';
import 'package:codepiraten/data/repository/advice_repo_rest_api.dart';
import 'package:codepiraten/domain/repositories/advice_repo.dart';
import 'package:codepiraten/presentation/advice_page/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  final client = http.Client();
  final dataSource = AdviceDataSourceRestApi(client: client);

  runApp(
    RepositoryProvider<AdviceRepo>(
      create: (context) => AdviceRepoRestApi(dataSource: dataSource),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdvicePageProvider(),
    );
  }
}
