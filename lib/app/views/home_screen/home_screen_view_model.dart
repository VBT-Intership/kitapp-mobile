import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/home_screen/home_screen.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

abstract class HomeScreenViewModel extends State<HomeScreen>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
