import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/components/Book_category_list_builder.dart';
import 'package:flutterfoodapp/app/components/card/book-card.dart';
import 'package:flutterfoodapp/app/components/category_list_builder.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/category_model.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import 'package:flutterfoodapp/notification_screen/view/notification_screen.dart';

import '../book_detail/book_detail.dart';
import '../book_result/book_result.dart';
import '../book_sell_screen/book_sell_screen.dart';
import '../login_screen/login_screen.dart';
import '../onboarding_screens/onboarding_screens.dart';
import '../profile_screen/profile_screen.dart';
import '../register_screen/register_screen.dart';
import '../sellers_screen/sellers_screen.dart';

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
      body: _showPage,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.greenAccent,
        index: 0,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.search, size: 20),
          Icon(Icons.book, size: 20),
          Icon(Icons.notifications_active, size: 20),
          Icon(Icons.supervised_user_circle, size: 20)
        ],
        onTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }

Widget _showPage = Container(
          padding: EdgeInsets.all(10),
          child: CategoryListBuilder(categories: dummyCategory));

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return Container(
          padding: EdgeInsets.all(10),
          child: CategoryListBuilder(categories: dummyCategory)); //Anasayfa
        break;
      case 1:
        return BookResult(); //search
        break;
      case 2:
        return BookSellsScreen(); //kitap ekle
      case 3:
        return NotificationScreen(); //bildiririmler
        break;
      case 4:
        return ProfileScreen();
        break;

      default:
        return Center(child: Text("hatalı Sayfa"));
    }
  }
}
