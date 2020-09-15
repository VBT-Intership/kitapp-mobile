import 'package:flutter/material.dart';
import 'package:flutterfoodapp/model/sellers_screen_model.dart';
import 'package:flutterfoodapp/view/sellers_screen.dart';
import 'package:flutterfoodapp/view_model/sellers_screen_view_model.dart';

class SellersScreenView extends SellersScreenViewModel {
  List<Sellers> sellers = [
    new Sellers("eda", "ersu", 3, 35),
    new Sellers("eda", "ersu", 3, 35),
    new Sellers("eda", "ersu", 3, 35),
    new Sellers("eda", "ersu", 3, 35),
    new Sellers("eda", "ersu", 3, 35)
  ];

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
          "Pumpkin Heads",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Center(),
      ),
    );
  }
}
