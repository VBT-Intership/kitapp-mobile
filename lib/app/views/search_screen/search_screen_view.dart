import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/extensions/context_entension.dart';
import '../../components/button/loginRadiusButton.dart';
import '../../models/books_service_model.dart';
import 'search_screen_view_model.dart';

class SearchScreenView extends SearchScreenViewModel {
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
                        SearchBar<BooksModel>(
                          onSearch: search,
                          onItemFound: (BooksModel list, int index) {
                            return ListTile(
                              onTap: () {
                                /// seçilen item ile kitap detaya barkod gönderme
                                navigation.navigateToPage(
                                    path: NavigationConstants.BOOK_DETAIL_VIEW,
                                    data: list.bookId);
                              },
                              title: Text(list.bookName),
                              subtitle: Text(list.bookDetail),
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

  Future<List<BooksModel>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return bookService.searchBook(search);
  }
}
