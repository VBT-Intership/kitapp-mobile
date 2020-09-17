import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

import 'register_screen.dart';

abstract class RegisterScreenViewModel extends State<RegisterScreen>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
