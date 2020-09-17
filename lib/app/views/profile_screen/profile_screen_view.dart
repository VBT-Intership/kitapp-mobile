import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/constants/enums/app_theme_enum.dart';
import 'package:flutterfoodapp/core/init/lang/language_service.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../core/init/notifier/theme_notifer.dart';
import 'profile_screen_view_model.dart';
import '../../../core/extensions/string_extension.dart';

class ProfileScreenView extends ProfileScreenViewModel {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  // final locales;
  final String userName = 'Emre Cevik';
  final String profileImageURL = 'https://cutt.ly/3fDkQoz';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeNotifier>(context);
    var locales = EasyLocalization.of(context);
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    var profile = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(profileImageURL),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Color(0xff5ABD8C), shape: BoxShape.circle),
                    child: Icon(
                      LineAwesomeIcons.pen,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            userName,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 50),
        profile,
        Column(
          children: [
            InkWell(
              onTap: () {
                themeProvider.changeTheme();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  themeProvider.currentThemeEnum() == AppThemes.LIGHT
                      ? LineAwesomeIcons.sun
                      : LineAwesomeIcons.cloud_with_sun,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                locales.locale = locales.locale.languageCode == "en"
                    ? LanguageService.instance.trLocale
                    : LanguageService.instance.enLocale;
              },
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  LineAwesomeIcons.language,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 30),
      ],
    );

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            header,
            SizedBox(height: 26),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListItem(
                      icon: LineAwesomeIcons.user,
                      text: 'Profil Düzenle'.locale),
                  ProfileListItem(
                      icon: LineAwesomeIcons.shopping_bag, text: 'İlanlarım'),
                  ProfileListItem(
                    icon: Icons.favorite,
                    text: 'Favorilerim',
                  ),
                  ProfileListItem(
                      icon: Icons.accessibility, text: 'Şifre Değiştir'),
                  ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Çıkış',
                    hasNavigation: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final ThemeNotifier buttonThemeProvider;
  const ProfileListItem(
      {Key key,
      this.icon,
      this.text,
      this.hasNavigation = true,
      this.buttonThemeProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: EdgeInsets.symmetric(horizontal: 36).copyWith(bottom: 12),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Color(0xff5ABD8C)),
      child: Row(
        children: [
          Icon(
            this.icon,
            size: 24,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Text(
            this.text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: 16,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
