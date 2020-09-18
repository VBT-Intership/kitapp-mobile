import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/app/views/book_sell_screen/book_sell_screen_view_model.dart';
import '../../components/button/loginRadiusButton.dart';
import '../../components/input/text_input.dart';
import '../../components/card/book-card.dart';
import '../../../core/extensions/context_entension.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/extensions/future_builder.dart';

//// input düzenle !
class BookSellsScreenView extends BookSellsScreenViewModel {
  TextEditingController emailController = TextEditingController();

  String _scanned_code = "";
  String _value = "";
  Future _scan_barcode() async {
    _scanned_code = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.DEFAULT);
    setState(() {
      getBarcodeID = _scanned_code; //????????????????????????????????
      _value = _scanned_code;
      print("Taranan code : " + _scanned_code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: context.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.normalValue),
            child: Column(
              children: [
                Spacer(flex: 4),
                Text("Sell Book".locale,
                    textAlign: TextAlign.start,
                    style: context.textTheme.headline5
                        .copyWith(fontFamily: "Light")),
                Expanded(
                    flex: 40,
                    child: BookCardView(
                        book: BooksModel(
                            writerName: "eda ersu",
                            bookName: "book",
                            imageUrl:
                                "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500",
                            bookStarCount: 3.5))),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: context.width,
                    child: OutlineIconButton(
                      icon: Icon(
                        Icons.center_focus_weak,
                        color: context.theme.bottomAppBarColor,
                      ),
                      text: "Scan".locale,
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
                    labelText: "Enter Price".locale,
                    warningText: "Insufficient Number of Characters".locale,
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
                      text: "Sell the Product".locale,
                      iconPadding: 10,
                      color: context.theme.primaryColor,
                      onpressed: () {
                        /* Future.value(getBookwithIsbn(_value))
                            .toBuild<BooksModel>(onSuccess: (data) {  //????????????????????????????????
                          return Text(data.bookId.toString());
                        }); */
                      },
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
