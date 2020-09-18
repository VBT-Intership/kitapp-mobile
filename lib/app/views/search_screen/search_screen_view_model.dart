import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/app/service/books_service.dart';
import 'package:flutterfoodapp/app/service/interfaces/IBooksService.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import 'search_screen.dart';

abstract class SearchScreenViewModel extends State<SearchScreen>
    with BaseViewModel {
  IBooksService bookService;
  @override
  void initState() {
    super.initState();
    bookService = BooksService.instance;
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
