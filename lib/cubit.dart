import 'package:codepiraten/presentation/task/common/advice_field.dart';
import 'package:codepiraten/presentation/advice_page/cubit/advicer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AdviceCubit>(
          create: (context) => AdviceCubit(
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
              BlocBuilder<AdviceCubit, AdviceCubitState>(
                builder: (context, state) {
                  switch (state) {
                    case AdviceStateLoading _:
                      return const CircularProgressIndicator();
                    case AdviceStateError error:
                      return AdviceField(advice: error.message);
                    case AdviceStateLoaded loaded:
                      return AdviceField(advice: loaded.advice);
                    default:
                      return const AdviceField(advice: 'Press the button!');
                  }
                },
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () => context.read<AdviceCubit>().fetch(),
                child: const Text('Press me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
