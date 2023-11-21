import 'package:flutter/cupertino.dart';

class ThemeService extends ChangeNotifier {
  ThemeService({required Mandant mandant}) {
    switch (mandant) {
      case Mandant.codepiraten:
        _baseColor = const Color(0xFFE65100);
        break;
      case Mandant.max:
        _baseColor = const Color(0xFF00B0FF);
        break;
    }
  }

  late Color _baseColor;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  Color get baseColor => _baseColor;

  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

enum Mandant {
  codepiraten('codepiraten'),
  max('max');

  final String value;

  const Mandant(this.value);

  factory Mandant.fromEnv(String value) {
    switch (value) {
      case 'codepiraten':
        return Mandant.codepiraten;
      case 'max':
        return Mandant.max;
      default:
        throw Exception('Unknown Mandant: $value');
    }
  }
}
