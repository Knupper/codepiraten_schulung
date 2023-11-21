import 'package:codepiraten/domain/entities/advice_entity.dart';
import 'package:codepiraten/domain/repositories/advice_repo.dart';

class AdviceRepoMock implements AdviceRepo {
  @override
  Future<AdviceEntity> getAdvice({String id = ''}) {
    return Future.value(AdviceEntity(advice: 'test', id: int.tryParse(id) ?? 1));
  }
}
