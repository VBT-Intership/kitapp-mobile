import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/views/book_sell_screen/book_sell_screen_view_model.dart';
import '../../components/button/loginRadiusButton.dart';
import '../../components/input/text_input.dart';
import '../../components/card/book-card.dart';
import '../../../core/extensions/context_entension.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BookSellsScreenView extends BookSellsScreenViewModel {
  TextEditingController emailController = TextEditingController();

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
          "Kitap Sat",
          style: TextStyle(color: context.colors.onSurface),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.sort),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: context.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.normalValue),
            child: Column(
              children: [
                Expanded(
                    flex: 40,
                    child: BookCardView(
                        book: Book(
                            author: "eda ersu",
                            name: "book",
                            urlimage:
                                "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500",
                            rating: 3.5))),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: context.width,
                    child: OutlineIconButton(
                      icon: Icon(
                        Icons.center_focus_weak,
                        color: context.theme.bottomAppBarColor,
                      ),
                      text: "Tara",
                      iconPadding: 10,
                      color: context.theme.primaryColor,
                      onpressed: () {
                        _scan_barcode();
                      },
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 6,
                  child: TextWidget(
                    labelText: "   Fiyat Giriniz",
                    warningText: "Karakter Sayısı Yetersiz",
                    inputType: TextInputType.number,
                    controller: emailController,
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: context.width,
                    child: OutlineIconButton(
                      icon: Icon(Icons.attach_money, color: Colors.white),
                      text: "Ürünü Sat",
                      iconPadding: 10,
                      color: context.theme.primaryColor,
                      onpressed: () {},
                    ),
                  ),
                ),
                Spacer(flex: 15)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
