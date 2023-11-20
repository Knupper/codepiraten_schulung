import 'package:codepiraten/presentation/task/common/advice_field.dart';
import 'package:codepiraten/presentation/task/provider/advice_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (context) => AdviceProvider(
                client: http.Client(),
              ),
          child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Consumer<AdviceProvider>(
                child: const Text('CHILD'),
                builder: (_, provider, child) {
                  if (provider.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (provider.hasError) {
                    return AdviceField(advice: provider.error);
                  }

                  return AdviceField(advice: provider.advice);
                },
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () => Provider.of<AdviceProvider>(context, listen: false).fetch(),
                child: const Text('Press me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
