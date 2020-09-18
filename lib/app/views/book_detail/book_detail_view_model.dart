import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/app/service/books_service.dart';
import 'package:flutterfoodapp/app/service/interfaces/IBooksService.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import 'book_detail.dart';

abstract class BookDetailViewModel extends State<BookDetail>
    with BaseViewModel {
  IBooksService bookService;
  BooksModel book;
  List<BooksModel> bookList;
  @override
  void initState() {
    super.initState();
    bookService = BooksService.instance;
  }

  Future<void> fillDetail(int bookId) async {
    book = await bookService.getBookDetail(2, bookId);
    bookList = await bookService.getBooksWithCategory(4);
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
