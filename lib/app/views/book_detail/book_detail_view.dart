import 'dart:ui';
// import 'package:flutterfoodapp/app/components/loginRadiusButton.dart';
// import 'package:flutterfoodapp/core/components/card/book-card.dart';

import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

import 'book_detail_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../components/card/book-card.dart';
import '../../../core/base/model/generalSettingsButton.dart';
// import '../../../core/components/button/shadow_button.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/extensions_provider.dart';
import '../../../core/extensions/future_builder.dart';
import '../../../core/init/notifier/theme_notifer.dart';

class BookDetailView extends BookDetailViewModel
    with SingleTickerProviderStateMixin {
  String descText =
      "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.";

  final List<Widget> myTabs = [
    Tab(text: 'Künye'),
    Tab(text: 'Genel Bakış'),
    Tab(text: 'Yorumlar'),
  ];

  TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topCard(context),
            tabBarArea(context),
            otherBooksArea(context)
          ],
        ),
      ),
    );
  }

//---------------TOPCARD---------------
//-------------------------------------
  Container topCard(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: topCarddBorderRadius(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
              color: Colors.white.withOpacity(0),
              child: Stack(
                children: [appbar(), topCardBookCard()],
              )),
        ),
      ),
      width: context.width,
      height: context.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: topCarddBorderRadius(),
        image: imageArea(),
      ),
    );
  }

  Padding appbar() {
    return Padding(
      padding: EdgeInsets.all(context.normalValue),
      child: AppBar(
        actions: [
          topCardCircleButton(Icons.favorite_border, Colors.black),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: topCardCircleButton(Icons.chevron_left, Colors.black),
      ),
    );
  }

  Ink topCardCircleButton(IconData icon, Color color) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: Colors.white,
        icon: Icon(icon, color: color),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget topCardBookCard() {
    return Align(
      alignment: Alignment(0, 0.8),
      child: Container(
        height: context.height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topCardBookCardImage(),
            topCardBookCardTitle(),
            topCardBookCardAuthorName(),
            topCardBuyButton()
          ],
        ),
      ),
    );
  }

  Container topCardBookCardImage() {
    return Container(
      width: context.width * 0.25,
      height: context.width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: imageArea(),
      ),
    );
  }

  DecorationImage imageArea() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(
          "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500"),
    );
  }

  Widget topCardBookCardTitle() {
    return SizedBox(
      width: context.width * 0.5,
      child: Center(
        child: AutoSizeText("İnsan Güzeldir",
            style: context.textTheme.headline5
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1),
      ),
    );
  }

  Widget topCardBookCardAuthorName() {
    return SizedBox(
      width: context.width * 0.6,
      child: Center(
        child: AutoSizeText("Sena Demirci",
            style: context.textTheme.headline6
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            maxLines: 1),
      ),
    );
  }

  RaisedButton topCardBuyButton() {
    return RaisedButton(
      disabledColor: Colors.white,
      focusColor: Colors.white,
      color: Colors.white,
      onPressed: () {
        navigation.navigateToPage(path: NavigationConstants.SELLER_VIEW);
      },
      child: Text(
        "Satın Al",
        style: TextStyle(color: Colors.green),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }

  BorderRadius topCarddBorderRadius() {
    return BorderRadius.only(
        bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35));
  }

//---------------//TOPCARD---------------
//---------------------------------------

//---------------//TABBAR AREA---------------
//-------------------------------------------

  Column tabBarArea(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: myTabs,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: context.mediumValue, right: context.mediumValue),
          child: Center(
            child: [
              tabBarAttributeTab(),
              tabBarDescTab(),
              tabBarCommentTab(context),
            ][_tabController.index],
          ),
        )
      ],
    );
  }

  Container tabBarDescTab() => Container(child: ReadMoreText(descText));

//---------------tabBarAttribute---------------
//---------------------------------------------

  ListView tabBarAttributeTab() {
    return ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemCount: 8,
        itemBuilder: (context, index) => tabBarAttributeCard(context));
  }

  Container tabBarAttributeCard(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "Yayın Tarihi",
            style: context.textTheme.subtitle1,
          ),
          Spacer(),
          Text(
            "01.05.2020",
          ),
        ],
      ),
    );
  }

  //---------------//tabbarAttribute---------------
  //-----------------------------------------------

  //---------------tabbarComment---------------
  //-------------------------------------------

  Container tabBarCommentTab(BuildContext context) {
    return Container(
      child: Column(
        children: [
          tabBarCommentHeader(context),
          Divider(),
          ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(),
              itemCount: 8,
              itemBuilder: (context, index) => tabBarCommentCard(context))
        ],
      ),
    );
  }

  Container tabBarCommentCard(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            Text("fatihemre",
                style: context.textTheme.subtitle1
                    .copyWith(fontWeight: FontWeight.w500)),
            Spacer(),
            RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: context.width * 0.04,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.green,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        ),
        Container(child: ReadMoreText(descText, height: context.height * 0.10)),
        Row(
          children: [
            Spacer(),
            Text("11.10.2020",
                style:
                    context.textTheme.subtitle2.copyWith(color: Colors.grey)),
          ],
        )
      ],
    ));
  }

  Widget tabBarCommentHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.normalValue),
      child: Row(
        children: [
          commentLengthText(context),
          Spacer(),
          commentButton(context)
        ],
      ),
    );
  }

  Text commentLengthText(BuildContext context) {
    return Text(
      "Yorum(8)",
      style: context.textTheme.subtitle1
          .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
    );
  }

  Row commentButton(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _commentModal();
          },
          child: Text("Yorum Yaz",
              style: context.textTheme.subtitle1
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.green)),
        ),
        Icon(Icons.chevron_right, color: Colors.green)
      ],
    );
  }

//---------------//tabbarComments---------------
//----------------------------------------------

//---------------//TABBAR AREA---------------
//-------------------------------------------

//---------------OTHERBOOKS---------------
//----------------------------------------

  Padding otherBooksArea(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.mediumValue,
        left: context.mediumValue,
        right: context.mediumValue,
      ),
      child: Container(
        child: Column(children: [
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                "İlgili Ürünler",
                style: context.textTheme.headline5
                    .copyWith(fontWeight: FontWeight.bold),
              )),
          Container(
            width: double.infinity,
            height: context.height * 0.35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, book) => OtherBooksCardView(
                book: OtherBooksCard(
                    author: "fatih emre",
                    name: "Çile",
                    imageURL:
                        "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500",
                    rating: 3),
              ),
            ),
          )
        ]),
      ),
    );
  }

//---------------//OTHERBOOKS---------------
//------------------------------------------

//---------------commentModel---------------
//------------------------------------------

  void _commentModal() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Yorum Yaz",
                    style: context.textTheme.headline6
                        .copyWith(color: Colors.green)),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 500,
                ),
                RatingBar(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: context.width * 0.10,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.mediumValue),
                  child: Container(
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        "Gönder",
                        style: context.textTheme.subtitle2
                            .copyWith(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onPressed: () {
                        final popup = BeautifulPopup(
                          context: context,
                          template: TemplateGift,
                        );
                        popup.show(
                          title: 'Yorumu yorumlara ekle',
                          content: 'Hellloo',
                          actions: [
                            popup.button(
                              label: 'Kapat',
                              onPressed: Navigator.of(context).pop,
                            ),
                          ],
                          // bool barrierDismissible = false,
                          // Widget close,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  //---------------//commentModal---------------
  //--------------------------------------------

}

class ReadMoreText extends StatefulWidget {
  final String text;
  final Color expandingButtonColor;
  final double height;
  ReadMoreText(this.text, {this.expandingButtonColor, this.height});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText>
    with TickerProviderStateMixin<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final expandingButtonColor = widget.expandingButtonColor != null
        ? widget.expandingButtonColor
        : Colors.green;

    final maxHeight =
        widget.height != null ? widget.height : context.height * 0.25;
    return Column(children: <Widget>[
      AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: maxHeight),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.text,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ))),
      Row(
        children: <Widget>[
          GestureDetector(
              child: Text('${isExpanded ? 'Show less' : 'Read more'}',
                  style: TextStyle(color: expandingButtonColor)),
              onTap: () => setState(() => isExpanded = !isExpanded))
        ],
      )
    ]);
  }
}

class OtherBooksCard {
  String author;
  String name;
  String imageURL;
  double rating;

  OtherBooksCard({this.author, this.name, this.imageURL, this.rating});
}

class OtherBooksCardView extends StatelessWidget {
  final OtherBooksCard book;

  const OtherBooksCardView({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.BOOK_DETAIL_VIEW);
      },
      child: Container(
        width: width * 0.35,
        height: height * 0.35,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Column(
            children: [
              Card(
                child: Image.network(
                  book.imageURL,
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    book.name,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    maxLines: 2,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "by " + book.author,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                    maxLines: 1,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: RatingBarIndicator(
                  rating: book.rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: width * 0.045,
                  direction: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
