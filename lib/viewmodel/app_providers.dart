import 'package:book_reader/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {

  AppProvider() {
    checkTheme();
  }

  Key? key = UniqueKey();
  ThemeData theme = ThemeConfig.lightTheme;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void setTheme(themeValue, valueSavePref) async {
    theme = themeValue;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', valueSavePref);
    notifyListeners();
  }

  Future<ThemeData> checkTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ThemeData themeData;
    String themeKey = preferences.getString('theme') ?? 'light';
    if (themeKey == 'light') {
      themeData = ThemeConfig.lightTheme;
    } else {
      themeData = ThemeConfig.darkTheme;
    }
    return themeData;
  }
}
