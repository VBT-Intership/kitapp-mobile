import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/components/Book_category_list_builder.dart';
import 'package:flutterfoodapp/app/components/card/book-card.dart';
import 'package:flutterfoodapp/app/components/category_list_builder.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/category_model.dart';

import 'home_screen_view_model.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("KitApp",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
            )),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: CategoryListBuilder(categories: dummyCategory)),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: <Widget>[
          Icon(Icons.view_module, size: 20),
          Icon(Icons.search, size: 20),
          Icon(Icons.home, size: 20),
          Icon(Icons.notification_important, size: 20),
          Icon(Icons.person, size: 20),
          Icon(Icons.book, size: 20)
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
