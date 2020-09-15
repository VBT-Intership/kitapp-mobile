import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfoodapp/core/constants/enums/app_theme_enum.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}

extension LocaleExtension on Locale {
  String get localeTag => this.toLanguageTag().split("-").last;
}

extension ThemeTypeExtension on String {
  AppThemes get toThemeEnum {
    switch (this) {
      case "AppThemes.LIGHT":
        return AppThemes.LIGHT;
      case "AppThemes.DARK":
        return AppThemes.DARK;
      default:
        throw "ERROR TYPE";
    }
  }
}
