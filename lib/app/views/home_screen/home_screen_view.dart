import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterfoodapp/app/components/Book_category_list_builder.dart';
import 'package:flutterfoodapp/app/components/card/book-card.dart';
import 'package:flutterfoodapp/app/components/category_list_builder.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/category_model.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_entension.dart';

import 'home_screen_view_model.dart';

class HomeScreenView extends HomeScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.all(10),
          child: CategoryListBuilder(categories: dummyCategory)),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: context.theme.primaryColor,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 20,
          ),
          Icon(Icons.search, size: 20),
          Icon(Icons.book, size: 20),
          Icon(Icons.notifications_active, size: 20),
          Icon(Icons.supervised_user_circle, size: 20)
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              navigation.navigateToPage(
                  path: NavigationConstants.HOME_SCREEN_VIEW);
              break;
            case 1:
              navigation.navigateToPage(
                  path: NavigationConstants.HOME_SCREEN_VIEW); // search gelicek
              break;
            case 2:
              navigation.navigateToPage(
                  path: NavigationConstants.BOOK_SELL_VIEW);
              break;
            case 3:
              navigation.navigateToPage(
                  path: NavigationConstants.NOTIFICATION_SCREEN_VIEW);
              break;
            case 4:
              navigation.navigateToPage(path: NavigationConstants.PROFILE_VIEW);
              break;

            default:
          }
        },
      ),
    );
  }
}
