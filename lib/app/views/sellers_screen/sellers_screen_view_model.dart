import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/sellers_screen/sellers_screen.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

abstract class SellersScreenViewModel extends State<SellersScreen>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
