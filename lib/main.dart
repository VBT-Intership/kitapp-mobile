import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/login_screen/login_screen.dart';
import 'package:flutterfoodapp/app/views/search_screen/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: SearchScreen(),
      ),
    );
  }
}
