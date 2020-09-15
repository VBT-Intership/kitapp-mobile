import 'package:flutter/material.dart';

enum GeneralSettingsEnum { TR, EN, DARK_THEME, LIGHT_THEME }

class GeneralSettings {
  const GeneralSettings({this.type, this.title, this.icon});
  final GeneralSettingsEnum type;
  final String title;
  final IconData icon;
}

const List<GeneralSettings> choices = const <GeneralSettings>[
  const GeneralSettings(
      type: GeneralSettingsEnum.TR, title: 'TR', icon: Icons.language),
  const GeneralSettings(
      type: GeneralSettingsEnum.EN, title: 'EN', icon: Icons.translate),
  const GeneralSettings(
      type: GeneralSettingsEnum.DARK_THEME,
      title: 'Dark Theme',
      icon: Icons.theater_comedy),
  const GeneralSettings(
      type: GeneralSettingsEnum.LIGHT_THEME,
      title: 'Light Theme',
      icon: Icons.backpack),
];
