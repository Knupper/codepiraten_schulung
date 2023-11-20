import 'package:codepiraten/presentation/task/common/advice_field.dart';
import 'package:codepiraten/presentation/task/riverpod/advice_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// State notifier provider holding the state
final randomAdviceProvider = StateNotifierProvider<AdviceRiverpod, AdviceModel>(
  (ref) => AdviceRiverpod(client: http.Client()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
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
              Consumer(
                builder: (context, ref, _) {
                  final advice = ref.watch(randomAdviceProvider);

                  if (advice.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (advice.hasError) {
                    return AdviceField(advice: advice.error);
                  }

                  return AdviceField(advice: advice.advice);
                },
              ),
              const Spacer(),
              Consumer(
                builder: (context, ref, _) {
                  return OutlinedButton(
                    onPressed: () => ref.read(randomAdviceProvider.notifier).fetch(),
                    child: const Text('Press me!'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
