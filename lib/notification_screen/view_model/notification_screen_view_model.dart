import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import 'package:flutterfoodapp/notification_screen/view/notification_screen.dart';

abstract class NotificationScreenViewModel extends State<NotificationScreen>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
