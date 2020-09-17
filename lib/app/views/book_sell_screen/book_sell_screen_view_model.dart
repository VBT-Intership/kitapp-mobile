import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/book_sell_screen/book_sell_screen.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

abstract class BookSellsScreenViewModel extends State<BookSellsScreen>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
