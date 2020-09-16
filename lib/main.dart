import 'package:flutter/material.dart';
import 'package:flutterfoodapp/category_choose_screen/view/category_choose.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: category_choose(),
    );
  }
}
