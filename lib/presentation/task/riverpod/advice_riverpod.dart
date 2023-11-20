import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class AdviceRiverpod extends StateNotifier<AdviceModel> {
  AdviceRiverpod({required this.client}) : super(AdviceModel(isLoading: false, advice: '', error: ''));
  final http.Client client;

  Future<void> fetch() async {
    state = AdviceModel(advice: '', error: '', isLoading: true);

    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      state = AdviceModel(
        advice: '',
        error: 'Ups, API Error. please try again!',
        isLoading: false,
      );
      return;
    }

    state = AdviceModel(
      advice: response.body,
      error: '',
      isLoading: false,
    );

    return;
  }
}

class AdviceModel {
  AdviceModel({
    required this.advice,
    required this.error,
    required this.isLoading,
  });

  final String advice;
  final String error;
  final bool isLoading;

  bool get hasError => error.isNotEmpty;
}
