import 'package:flutter/material.dart';

import 'package:flutterfoodapp/app/views/sellers_screen/sellers_screen.dart';
import 'package:flutterfoodapp/app/views/onboarding_screens/onboarding_screens.dart';

import 'package:flutterfoodapp/app/views/book_detail/book_detail.dart';
import 'package:flutterfoodapp/app/views/login_screen/login_screen.dart';

import 'app/views/book_sell_screen/book_sell_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: OnBoardingScreens(),
    );
  }
}

/*

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


      */
