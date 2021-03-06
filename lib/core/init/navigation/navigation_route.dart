import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfoodapp/app/views/category_choose_screen/view/category_choose.dart';
import 'package:flutterfoodapp/app/views/home_screen/home_screen.dart';
import 'package:flutterfoodapp/app/views/search_screen/search_screen.dart';
import 'package:flutterfoodapp/app/views/search_screen/search_screen_view.dart';
import 'package:flutterfoodapp/notification_screen/view/notification_screen.dart';

import '../../../app/views/book_detail/book_detail.dart';
import '../../../app/views/book_result/book_result.dart';
import '../../../app/views/book_sell_screen/book_sell_screen.dart';
import '../../../app/views/login_screen/login_screen.dart';
import '../../../app/views/onboarding_screens/onboarding_screens.dart';
import '../../../app/views/profile_screen/profile_screen.dart';
import '../../../app/views/register_screen/register_screen.dart';
import '../../../app/views/sellers_screen/sellers_screen.dart';

//import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    // args.arguments
    switch (args.name) {
      case NavigationConstants.BOOK_DETAIL_VIEW:
        return normalNavigate(BookDetail(), args.arguments);
        break;
      case NavigationConstants.BOOK_RESULT_VIEW:
        return normalNavigate(BookResult(), args.arguments);
        break;
      case NavigationConstants.BOOK_SELL_VIEW:
        return normalNavigate(BookSellsScreen(), args.arguments);
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(LoginScreen(), args.arguments);
        break;
      case NavigationConstants.ONBOARDING_VIEW:
        return normalNavigate(OnBoardingScreens(), args.arguments);
        break;
      case NavigationConstants.PROFILE_VIEW:
        return normalNavigate(ProfileScreen(), args.arguments);
        break;
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(RegisterScreen(), args.arguments);
        break;
      case NavigationConstants.SELLER_VIEW:
        return normalNavigate(SellersScreen(), args.arguments);
        break;
      case NavigationConstants.CATEGORY_CHOOSE_VIEW:
        return normalNavigate(CategoryChoose(), args.arguments);
        break;
      case NavigationConstants.HOME_SCREEN_VIEW:
        return normalNavigate(HomeScreen(), args.arguments);
        break;
      case NavigationConstants.NOTIFICATION_SCREEN_VIEW:
        return normalNavigate(NotificationScreen(), args.arguments);
        break;
      case NavigationConstants.SEARCH_SCREEN_VIEW:
        return normalNavigate(SearchScreen(), args.arguments);
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: Container(child: Text("ERROR 101")),
          ),
        );
        break;
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, int id) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(
        arguments: id,
      ),
    );
  }
}
