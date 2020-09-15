import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/constants/enums/app_theme_enum.dart';
import 'package:flutterfoodapp/core/init/lang/language_service.dart';

import 'appSettings.dart';

class GeneralSettingsButton extends StatelessWidget {
  final themeProvider;
  final locales;

  const GeneralSettingsButton({Key key, this.themeProvider, this.locales})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: genaralSettingsPopup(),
    );
  }

  Widget genaralSettingsPopup() {
    return PopupMenuButton<GeneralSettings>(
        icon: Icon(Icons.short_text),
        onSelected: _changeAppSettings,
        itemBuilder: (BuildContext context) {
          return choices.map((GeneralSettings choice) {
            return PopupMenuItem<GeneralSettings>(
                value: choice,
                child: ListTile(
                    leading: Icon(choice.icon), title: Text(choice.title)));
          }).toList();
        });
  }

  void _changeAppSettings(GeneralSettings choice) {
    switch (choice.type) {
      case GeneralSettingsEnum.TR:
        locales.locale = LanguageService.instance.trLocale;
        break;
      case GeneralSettingsEnum.EN:
        locales.locale = LanguageService.instance.enLocale;
        break;
      case GeneralSettingsEnum.DARK_THEME:
        themeProvider.setTheme(AppThemes.DARK);
        break;
      case GeneralSettingsEnum.LIGHT_THEME:
        themeProvider.setTheme(AppThemes.LIGHT);
        break;
    }
  }
}
