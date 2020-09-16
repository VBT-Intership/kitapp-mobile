import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/book_sell_screen/book_sell_screen_view_model.dart';
import 'package:flutterfoodapp/core/extensions/future_builder.dart';

class BookSellsScreenView extends BookSellsScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Kitap Sat",
          style: TextStyle(color: Colors.black, fontSize: 21),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: Container(),
    );
  }
}
