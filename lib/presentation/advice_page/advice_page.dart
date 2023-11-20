import 'package:codepiraten/domain/repositories/advice_repo.dart';
import 'package:codepiraten/domain/use_cases/advice_use_case.dart';
import 'package:codepiraten/presentation/advice_page/cubit/advicer_cubit.dart';
import 'package:codepiraten/presentation/advice_page/widgets/advice_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvicePageProvider extends StatelessWidget {
  const AdvicePageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdviceCubit>(
      create: (context) => AdviceCubit(
        useCase: AdviceUseCase(
          RepositoryProvider.of<AdviceRepo>(context),
        ),
      ),
      child: const AdvicePage(),
    );
  }
}

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AdviceCubit, AdviceCubitState>(
          builder: (builderContext, state) {
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
        OutlinedButton(
          onPressed: () => context.read<AdviceCubit>().fetch(),
          child: const Text('Press me!'),
        ),
      ],
    );
  }
}
