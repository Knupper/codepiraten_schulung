import 'package:codepiraten/domain/repositories/advice_repo.dart';

class AdviceUseCase {
  final AdviceRepo _repository;

  AdviceUseCase(this._repository);

  Future<String> getRandomAdvice() async {
    final result = await _repository.getAdvice();

    return result.advice;
  }

  Future<String> getAdvice({String? id}) async {
    final result = await _repository.getAdvice();

    return result.advice;
  }
}
