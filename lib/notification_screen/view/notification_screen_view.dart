import 'package:flutter/material.dart';
import 'package:flutterfoodapp/notification_screen/model/notification_general_model.dart';
import 'package:flutterfoodapp/notification_screen/view/notification_screen.dart';
import 'package:flutterfoodapp/notification_screen/view/tab_general_page_view.dart';
import 'package:flutterfoodapp/notification_screen/view/tab_offers_page_view.dart';
import 'package:flutterfoodapp/notification_screen/view_model/notification_screen_view_model.dart';
import 'package:flutterfoodapp/core/extensions/future_builder.dart';
import 'package:flutterfoodapp/sellers_screen/model/sellers_screen_model.dart';
import 'package:flutterfoodapp/core/extensions/context_entension.dart';
import '../../core/extensions/string_extension.dart';

// bottomAppBarColor
class NotificationScreenView extends NotificationScreenViewModel {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: context.theme.selectedRowColor,
              onTap: (index) {
                // Tab index when user select it, it start from zero
              },
              tabs: [
                Tab(
                  child: Text(
                    "General".locale,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Tab(
                  child: Text(
                    "Offers".locale,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            title: Text(
              'Notifications'.locale,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          body: TabBarView(
            children: [
              tab_general_page_view(context),
              tab_offers_view_page(context),
            ],
          ),
        ),
      ),
    );
  }
}
