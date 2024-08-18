import 'package:flutter/material.dart';
import 'package:stock_track/themes/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider({ThemeData? themeData}) : _themeData = themeData ?? lightTheme;

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else {
      _themeData = lightTheme;
    }
    notifyListeners();
  }
}
