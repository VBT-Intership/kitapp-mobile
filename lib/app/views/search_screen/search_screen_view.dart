import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/search_screen/search_screen_view_model.dart';
import 'package:flutterfoodapp/app/models/search_screen_model.dart';
import 'package:flutterfoodapp/app/views/search_screen/deneme_post.dart';
import 'package:flutterfoodapp/app/components/button/loginRadiusButton.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class SearchScreenView extends SearchScreenViewModel {
  
  String _scanned_code = "";
  String _value = "";
  Future _scan_barcode() async {
    _scanned_code = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.DEFAULT);
    setState(() {
      _value = _scanned_code;
      print("Taranan code : " + _scanned_code);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Stack(
                children: [
                  SearchBar<Post>(
                    onSearch: search,
                    onItemFound: (Post post, int index) {
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.description),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          margin: new EdgeInsets.only(left:10,right: 10,bottom: 50),
          child: OutlineIconButton(
            icon: Icon(Icons.center_focus_weak,color: Colors.white,),
            text: 'Tara',
            iconPadding: 10,
            color: Colors.green[500],
            onpressed: (){
               _scan_barcode();
            },

          ),
        )
      ],
    ));
  }
}
