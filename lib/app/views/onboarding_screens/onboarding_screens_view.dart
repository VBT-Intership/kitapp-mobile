import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/onboarding_screens/sk_onboarding_screen.dart';
import 'package:flutterfoodapp/app/models/onboarding_screens_model.dart';
import 'package:flutterfoodapp/app/views/onboarding_screens/onboarding_screens_view_model.dart';
import 'package:flutterfoodapp/app/views/sellers_screen/sellers_screen.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

class OnBoardingScreensView extends OnBoardingScreensViewModel {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0x90189140),
        pages: pages,
        skipClicked: (value) {
          navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
        },
        getStartedClicked: (value) {
          navigation.navigateToPage(path: NavigationConstants.LOGIN_VIEW);
        },
      ),
    );
  }
}
