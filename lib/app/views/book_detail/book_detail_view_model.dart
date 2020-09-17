import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import 'book_detail.dart';

abstract class BookDetailViewModel extends State<BookDetail>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
