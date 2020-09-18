import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/views/search_screen/search_screen_view_model.dart';
import 'package:flutterfoodapp/app/models/search_screen_model.dart';
import 'package:flutterfoodapp/app/views/search_screen/deneme_post.dart';
import 'package:flutterfoodapp/app/components/button/loginRadiusButton.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/extensions/context_entension.dart';

class SearchScreenView extends SearchScreenViewModel {
  List<Post> list = [
    new Post("ghjk", "ghjkl"),
    new Post("ghjk", "ghjkl"),
    new Post("ghjk", "ghjkl"),
    new Post("ghjk", "ghjkl"),
    new Post("ghjk", "ghjkl"),
    new Post("ghjk", "ghjkl"),
    new Post("ghjk", "ghjkl"),
  ];
  String _scanned_code = "";
  String _value = "";
  Future _scan_barcode() async {
    _scanned_code = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.DEFAULT);
    setState(() {
      _value = _scanned_code;
      print("Taranan code : " + _scanned_code);
      ///// tara butonu ile kitap detaya barkod gönderme
      navigation.navigateToPage(
          path: NavigationConstants.BOOK_DETAIL_VIEW,
          data: int.parse(_scanned_code));
    });
  }

  @override
  Widget build(BuildContext context) {
    int number = 9786059851558;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: 500,
          height: context.height * 0.9,
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        SearchBar<Post>(
                          onSearch: search,
                          onItemFound: (Post list, int index) {
                            return ListTile(
                              onTap: () {
                                /// seçilen item ile kitap detaya barkod gönderme
                                navigation.navigateToPage(
                                    path: NavigationConstants.BOOK_DETAIL_VIEW,
                                    data: index);
                              },
                              title: Text(list.title),
                              subtitle: Text(list.description),
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
                margin: new EdgeInsets.only(left: 10, right: 10, bottom: 50),
                child: OutlineIconButton(
                  icon: Icon(
                    Icons.center_focus_weak,
                    color: Colors.white,
                  ),
                  text: 'Scan'.locale,
                  iconPadding: 10,
                  color: context.theme.primaryColor,
                  onpressed: () {
                    _scan_barcode();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
