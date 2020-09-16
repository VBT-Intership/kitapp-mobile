import 'dart:ui';
import 'book_detail_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/base/model/generalSettingsButton.dart';
import '../../../core/components/button/shadow_button.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/extensions_provider.dart';
import '../../../core/extensions/future_builder.dart';
import '../../../core/init/notifier/theme_notifer.dart';

class BookDetailView extends BookDetailViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: topCard(context),
    );
  }



  Container topCard(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: topCarddBorderRadius(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
              color: Colors.white.withOpacity(0),
              child: Stack(
                children: [appbar(), topCardBookCard()],
              )),
        ),
      ),
      width: context.width,
      height: context.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: topCarddBorderRadius(),
        image: imageArea(),
      ),
    );
  }

/*
* ------topCardBook-------
*/

  Widget topCardBookCard() {
    return Align(
      alignment: Alignment(0, 0.8),
      child: Container(
        height: context.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topCardBookCardImage(),
            topCardBookCardTitle(),
            topCardBookCardAuthorName(),
            topCardBuyButton()
          ],
        ),
      ),
    );
  }

  RaisedButton topCardBuyButton() {
    return RaisedButton(
      disabledColor: Colors.white,
      focusColor: Colors.white,
      color: Colors.white,
      onPressed: null,
      child: Text(
        "Satın Al",
        style: TextStyle(color: Colors.green),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }

  Container topCardBookCardImage() {
    return Container(
      width: context.width * 0.25,
      height: context.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: imageArea(),
      ),
    );
  }

  DecorationImage imageArea() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
          "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500"),
    );
  }

  Text topCardBookCardTitle() {
    return Text("İnsan Güzeldir",
        style: context.textTheme.headline5
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold));
  }

  Text topCardBookCardAuthorName() {
    return Text("Senai Demirci",
        style: context.textTheme.headline6
            .copyWith(color: Colors.white, fontWeight: FontWeight.bold));
  }

  BorderRadius topCarddBorderRadius() {
    return BorderRadius.only(
        bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35));
  }

/*
* -----//topCardBook-------
*/

/*
* -----Appbar-------
*/

  Padding appbar() {
    return Padding(
      padding: EdgeInsets.all(context.normalValue),
      child: AppBar(
        actions: [
          topCardCircleButton(Icons.favorite_border, Colors.black),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: topCardCircleButton(Icons.chevron_left, Colors.black),
      ),
    );
  }

  Ink topCardCircleButton(IconData icon, Color color) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: Colors.white,
        icon: Icon(icon, color: color),
        onPressed: () {},
      ),
    );
  }

  /*
  * -----//Appbar-------
  */

}
