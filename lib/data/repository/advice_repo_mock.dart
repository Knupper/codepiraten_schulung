import 'package:codepiraten/domain/entities/advice_entity.dart';
import 'package:codepiraten/domain/repositories/advice_repo.dart';

class AdviceRepoMock implements AdviceRepo {
  @override
  Future<AdviceEntity> getAdvice() {
    return Future.value(const AdviceEntity(advice: 'test', id: 1));
  }
}
