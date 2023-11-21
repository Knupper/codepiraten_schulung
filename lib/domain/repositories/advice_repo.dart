import 'package:codepiraten/domain/entities/advice_entity.dart';

abstract class AdviceRepo {
  Future<AdviceEntity> getAdvice({String id});
}
