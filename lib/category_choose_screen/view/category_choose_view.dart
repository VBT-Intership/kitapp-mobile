import 'package:flutter/material.dart';
import 'package:flutterfoodapp/category_choose_screen/view_model/category_choose_viewmodel.dart';
import 'package:circular_check_box/circular_check_box.dart';

Color cardcolorgeneral = Color(0xffD3D3D3);
List<String> indexList = new List();

class CategoryChooseView extends CategoryChooseViewModel {
  Items item1 = new Items(
      title: "Biography",
      index: 0,
      istrue: false,
      cardcolor: cardcolorgeneral,
      description: "des1",
      totalbook: 12);
  Items item2 = new Items(
      title: "Business",
      index: 1,
      istrue: false,
      cardcolor: cardcolorgeneral,
      description: "des2",
      totalbook: 14);
  Items item3 = new Items(
      title: "Children",
      index: 2,
      istrue: false,
      cardcolor: cardcolorgeneral,
      description: "des3",
      totalbook: 16);
  Items item4 = new Items(
      title: "Cookery",
      index: 3,
      istrue: false,
      cardcolor: cardcolorgeneral,
      description: "des4",
      totalbook: 18);
  Items item5 = new Items(
      title: "Fiction",
      index: 4,
      istrue: false,
      cardcolor: cardcolorgeneral,
      description: "des5",
      totalbook: 19);
  Items item6 = new Items(
      title: "Graphic novels",
      index: 5,
      istrue: false,
      cardcolor: cardcolorgeneral,
      description: "des6",
      totalbook: 23);
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
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
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
      childAspectRatio: 3.0,
      padding: EdgeInsets.only(left: 5, right: 5),
      crossAxisCount: 1,
      crossAxisSpacing: 18,
      mainAxisSpacing: 5,
      children: myList.map((data) {
        return Material(
          child: new InkWell(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: data.cardcolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularCheckBox(
                      value: data.istrue,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      activeColor: Color(0XFF089000),
                      onChanged: (value) {
                        setState(() {
                          // data.istrue = value;
                          // print(data.istrue);
                        });
                      }),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            data.title,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            data.description.toString(),
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            data.totalbook.toString(),
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              setState(() {
                if (data.istrue == false) {
                  data.cardcolor = Color(0xff4DBD33);
                  data.istrue = true;
                  indexList.add(data.title);
                } else {
                  data.cardcolor = Color(0xffD3D3D3);
                  data.istrue = false;
                  indexList.removeAt(data.index);
                }

                print(data.istrue);
              });
            },
          ),
        );
      }).toList(),
    ));
  }
}

class Items {
  String title;
  bool istrue;
  int index;
  Color cardcolor;
  String description;
  int totalbook;
  Items(
      {this.title,
      this.index,
      this.istrue,
      this.cardcolor,
      this.description,
      this.totalbook});
}
