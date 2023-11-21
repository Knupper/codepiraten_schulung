import 'dart:convert';

import 'package:codepiraten/data/data_sources/advice_data_source.dart';
import 'package:codepiraten/data/dtos/advice_dto.dart';
import 'package:http/http.dart' as http;

class AdviceDataSourceRestApi implements AdviceRemoteDataSource {
  const AdviceDataSourceRestApi({required this.client});

  final http.Client client;

  @override
  Future<AdviceDto> getAdvice({String id = ''}) async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice/$id'),
      headers: {
        'accept': 'application/json',
      },
    );

    // TODO error handling
    // TODO Json serialization


    return Future.value(AdviceDto.fromJson(jsonDecode(response.body)));
  }
}
