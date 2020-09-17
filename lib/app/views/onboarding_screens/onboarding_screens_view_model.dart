import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/onboarding_screens/onboarding_screens.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

abstract class OnBoardingScreensViewModel extends State<OnBoardingScreens>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
