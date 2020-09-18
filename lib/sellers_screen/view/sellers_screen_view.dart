import 'package:flutter/material.dart';
import 'package:flutterfoodapp/sellers_screen/model/sellers_screen_model.dart';
import 'package:flutterfoodapp/sellers_screen/view/sellers_screen.dart';
import 'package:flutterfoodapp/sellers_screen/view_model/sellers_screen_view_model.dart';
import 'package:flutterfoodapp/core/extensions/future_builder.dart';
import '../../core/extensions/string_extension.dart';

class SellersScreenView extends SellersScreenViewModel {
  List<Sellers> sellers = [
    new Sellers("Eda", "Ersu", 3, 35),
    new Sellers("Eda", "Ersu", 3, 35),
    new Sellers("Eda", "Ersu", 3, 35),
    new Sellers("Eda", "Ersu", 3, 35),
    new Sellers("Eda", "Ersu", 3, 35),
    new Sellers("Eda", "Ersu", 3, 35),
    new Sellers("Eda", "Ersu", 3, 35),
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
      body: Container(
          child: Future.value(sellers).toBuild<List<Sellers>>(
        onSuccess: (data) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) => sellersCard(data[index]));
        },
      )),
    );
  }

  Container sellersCard(Sellers seller) => Container(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          seller.name + " " + seller.surname,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(seller.km.toString() + "km near".locale),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          seller.price.toString() + "₺",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 80,
                                child: RaisedButton(
                                  child: Text(
                                    "Give Offer".locale,
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.green),
                                  ),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.green)),
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: SizedBox(
                                  height: 30,
                                  width: 80,
                                  child: RaisedButton(
                                    color: Colors.green,
                                    child: Text(
                                      "Buy".locale,
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.white),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                height: 20,
                thickness: 1,
                endIndent: 0,
              ),
            ],
          ),
        ),
      );
}
