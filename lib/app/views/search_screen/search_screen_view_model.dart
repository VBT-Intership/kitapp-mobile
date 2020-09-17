import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import 'search_screen.dart';

abstract class SearchScreenViewModel extends State<SearchScreen>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
