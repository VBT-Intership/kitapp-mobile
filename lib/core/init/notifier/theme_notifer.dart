import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/constants/enums/locale_keys_enum.dart';
import 'package:flutterfoodapp/core/init/cache/locale_manager.dart';
import 'package:flutterfoodapp/core/init/theme/dark_theme.dart';
import 'package:flutterfoodapp/core/init/theme/light_theme.dart';
import '../../constants/enums/app_theme_enum.dart';
import '../../extensions/string_extension.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme;

  ThemeData get currentTheme {
    AppThemes defaultTheme = LocaleManager.instance
            .getStringValue(PreferencesKeys.THEME)
            .toThemeEnum ??
        AppThemes.LIGHT;
    _currentTheme = findTheme(defaultTheme);
    return _currentTheme;
  }

  ThemeData findTheme(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      return myLightTheme;
    } else {
      return myDarkTheme;
    }
  }

  void setTheme(AppThemes theme) {
    _currentTheme = findTheme(theme);
    LocaleManager.instance
        .setStringValue(PreferencesKeys.THEME, theme.toString());
    notifyListeners();
  }
}
