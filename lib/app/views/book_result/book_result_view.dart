import 'package:flutter/material.dart';
import 'book_result_view_model.dart';

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

class BookResultView extends BookResultViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.chevron_left, color: Colors.black),
        title: Text(
          "Felsefe",
          style:
              context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.sort,
            color: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: context.lowValue, right: context.lowValue),
            child: Icon(Icons.filter_alt, color: Colors.grey),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              BookResultCardView(
                book: BookResultCard(
                    author: "fatih emre",
                    name: "Çile",
                    imageURL:
                        "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500",
                    rating: 3),
              ),
              BookResultCardView(
                book: BookResultCard(
                    author: "fatih emre",
                    name: "Çile",
                    imageURL:
                        "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500",
                    rating: 3),
              ),
              BookResultCardView(
                book: BookResultCard(
                    author: "fatih emre",
                    name: "Çile",
                    imageURL:
                        "https://img.kitapyurdu.com/v1/getImage/fn:11274484/wh:true/wi:500",
                    rating: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookResultCard {
  String author;
  String name;
  String imageURL;
  double rating;

  BookResultCard({this.author, this.name, this.imageURL, this.rating});
}

class BookResultCardView extends StatelessWidget {
  final BookResultCard book;

  const BookResultCardView({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: Container(
        height: height * 0.21,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Row(
            children: [
              Expanded(flex: 1, child: bookResultCardImage()),
              Expanded(
                  flex: 3, child: bookResultCardContentArea(context, width))
            ],
          ),
        ),
      ),
    );
  }

  Padding bookResultCardContentArea(BuildContext context, double width) {
    return Padding(
      padding: EdgeInsets.only(left: context.normalValue),
      child: Container(
        // color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            bookResultCardTitle(context),
            Padding(
              padding: EdgeInsets.only(
                  top: context.lowValue, bottom: context.lowValue),
              child: bookResultCardAuthor(context),
            ),
            bookResultCardCategory(context),
            Spacer(),
            bookResultCardBottomBar(context)
          ],
        ),
      ),
    );
  }

  Container bookResultCardBottomBar(BuildContext context) {
    return Container(
      child: Row(
        children: [
          bookResultCardStar(context),
          Spacer(),
          bookResultCardFavoriteButton(context),
        ],
      ),
    );
  }

  Padding bookResultCardFavoriteButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.normalValue),
      child: Icon(
        Icons.favorite_border,
        color: Colors.grey,
      ),
    );
  }

  Container bookResultCardCategory(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: context.lowValue, right: context.lowValue, top: 1, bottom: 1),
        child: Text(
          "felsefe",
          style: context.textTheme.bodyText1.copyWith(color: Colors.green),
        ),
      ),
    );
  }

  Widget bookResultCardAuthor(BuildContext context) {
    return SizedBox(
      width: context.width * 0.5,
      child: AutoSizeText(book.author,
          style: context.textTheme.subtitle2
              .copyWith(fontWeight: FontWeight.w300, color: Colors.grey),
          maxLines: 1),
    );
  }

  Widget bookResultCardTitle(BuildContext context) {
    return SizedBox(
      width: context.width * 0.5,
      child: AutoSizeText(book.name,
          style: context.textTheme.headline4.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1),
    );
  }

  Card bookResultCardImage() {
    return Card(
      child: Image.network(
        book.imageURL,
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
    );
  }

  RatingBarIndicator bookResultCardStar(BuildContext context) {
    return RatingBarIndicator(
      rating: book.rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: context.width * 0.045,
      direction: Axis.horizontal,
    );
  }
}
