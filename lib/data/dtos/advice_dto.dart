class AdviceDto {
  final String advice;
  final int id;

  AdviceDto({
    required this.advice,
    required this.id,
  });

  factory AdviceDto.fromJson(Map<String, dynamic> json) {
    return AdviceDto(
      advice: json['advice'],
      id: json['advice_id'],
    );
  }
}

// TODO show json genreation