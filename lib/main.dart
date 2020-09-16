import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/sellers_screen/sellers_screen.dart';
import 'package:flutterfoodapp/app/views/book_detail/book_detail.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BookDetail(),
    );
  }
}
