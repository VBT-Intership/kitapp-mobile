import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/book_sell_screen/book_sell_screen.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

import '../../models/books_service_model.dart';
import '../../service/books_service.dart';
import '../../service/interfaces/IBooksService.dart';

abstract class BookSellsScreenViewModel extends State<BookSellsScreen>
    with BaseViewModel {
  IBooksService bookService;
  BooksModel book;
  BooksModel borcodeBookID;

  String getBarcodeID;

  @override
  void initState() {
    super.initState();
    bookService = BooksService.instance;
  }

  Future<BooksModel> getBookwithIsbn(String isbnnumber) async {
    borcodeBookID = await bookService.getBookBarcode(2, isbnnumber);
    // book = await bookService.getBookDetail(2, borcodeBookID.bookId);
    return borcodeBookID;
  }


  /* Future<void> fillDetail(int bookId) async {
    book = await bookService.getBookDetail(2, bookId);
    bookList = await bookService.getBooksWithCategory(4);
  } */
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
