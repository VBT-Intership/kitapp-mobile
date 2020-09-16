import 'package:flutter/material.dart';
import 'package:flutterfoodapp/category_choose_screen/view_model/category_choose_viewmodel.dart';
import 'package:circular_check_box/circular_check_box.dart';

class CategoryChooseView extends CategoryChooseViewModel {
  Items item1 = new Items(title: "Biography", istrue: false);
  Items item2 = new Items(title: "Business", istrue: false);
  Items item3 = new Items(title: "Children", istrue: false);
  Items item4 = new Items(title: "Cookery", istrue: false);
  Items item5 = new Items(title: "Fiction", istrue: false);
  Items item6 = new Items(title: "Graphic novels", istrue: false);
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Kategoriler",
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ])),

          categoryexpanded(myList), //expanded yeri
          Container(
            //rounded button
            padding: EdgeInsets.all(10.0),
            height: 60.0,
            width: 300.0,
            child: GestureDetector(
              onTap: () {
                print("okey");
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.greenAccent,
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded categoryexpanded(List<Items> myList) {
    return Expanded(
        child: GridView.count(
      childAspectRatio: 1.0,
      padding: EdgeInsets.only(left: 40, right: 40),
      crossAxisCount: 2,
      crossAxisSpacing: 24,
      mainAxisSpacing: 18,
      children: myList.map((data) {
        return Material(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff747474),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularCheckBox(
                    value: data.istrue,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    activeColor: Colors.greenAccent,
                    onChanged: (value) {
                      setState(() {
                        data.istrue = value;
                        print(data.istrue);
                      });
                    }),
                Text(
                  data.title,
                  style: TextStyle(
                      fontFamily: "Roboto", fontSize: 15, color: Colors.white),
                )
              ],
            ),
          ),
        );
      }).toList(),
    ));
  }
}

class Items {
  String title;
  bool istrue;

  Items({this.title, this.istrue});
}
