import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/views/home_screen/home_screen.dart';
import 'app/views/login_screen/login_screen.dart';
import 'app/views/onboarding_screens/onboarding_screens.dart';
import 'core/constants/app/app_constants.dart';
import 'core/constants/enums/locale_keys_enum.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_service.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.prefrencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageService.instance.locales,
        path: AppConstansts.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      title: AppConstansts.APP_NAME,
      home: getView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}

Widget getView() {
  String data = LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);
  if (data == "") {
    if (LocaleManager.instance.getStringValue(PreferencesKeys.ONBOARDING) ==
        "") {
      LocaleManager.instance
          .setStringValue(PreferencesKeys.ONBOARDING, 'onboarding');
      return OnBoardingScreens();
    } else {
      return LoginScreen();
    }
  } else {
    return HomeScreen();
  }
}

/*

bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: <Widget>[
          Icon(Icons.view_module, size: 20),
          Icon(Icons.search, size: 20),
          Icon(Icons.home, size: 20),
          Icon(Icons.notification_important, size: 20),
          Icon(Icons.person, size: 20),
          Icon(Icons.book, size: 20)
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),


      */
