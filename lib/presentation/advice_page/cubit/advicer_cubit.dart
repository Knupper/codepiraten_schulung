import 'package:codepiraten/domain/use_cases/advice_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_state.dart';

const serverFailureMessage = 'Ups, API Error. please try again!';

class AdviceCubit extends Cubit<AdviceCubitState> {
  AdviceCubit({required this.useCase}) : super(const AdviceInitial());
  final AdviceUseCase useCase;

  // final AdviceRepo repository;

  void fetchRandom() async {
    emit(const AdviceStateLoading());

    final result = await useCase.getRandomAdvice();

    if (result.isEmpty) {
      emit(const AdviceStateError(message: serverFailureMessage));
      return;
    }

    emit(AdviceStateLoaded(advice: result));
  }

  Future<void> fetch({String id = ''}) async {
    emit(const AdviceStateLoading());

    final result = await useCase.getAdvice(id: id);

    if (result.isEmpty) {
      emit(const AdviceStateError(message: serverFailureMessage));
      return;
    }

    emit(AdviceStateLoaded(advice: result));
  }
}
