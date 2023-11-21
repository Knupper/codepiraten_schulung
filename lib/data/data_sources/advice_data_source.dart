import 'package:codepiraten/data/dtos/advice_dto.dart';

abstract class AdviceRemoteDataSource {
  Future<AdviceDto> getAdvice({String id});
}
