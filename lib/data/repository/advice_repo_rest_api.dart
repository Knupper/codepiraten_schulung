import 'package:codepiraten/data/data_sources/advice_data_source.dart';
import 'package:codepiraten/domain/entities/advice_entity.dart';
import 'package:codepiraten/domain/repositories/advice_repo.dart';

class AdviceRepoRestApi implements AdviceRepo {

  const AdviceRepoRestApi({required this.dataSource});
  final AdviceRemoteDataSource dataSource;

  @override
  Future<AdviceEntity> getAdvice() async {
    final advice = await dataSource.getAdvice();

    return AdviceEntity(advice: advice.advice, id: advice.id);
  }
}
