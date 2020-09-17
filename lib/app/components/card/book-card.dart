import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import '../../../core/extensions/context_entension.dart';

class BookCardView extends StatelessWidget {
  final Book book;

  const BookCardView({Key key, @required this.book}) : super(key: key);

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
        height: height * 0.425,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Column(
            children: [
              Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    book.urlimage,
                    fit: BoxFit.cover,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    book.name,
                    style: TextStyle(
                        fontSize: 15, color: context.theme.selectedRowColor),
                    maxLines: 2,
                  ),
                ),
              ),
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

abstract class BaseViewModel {
  final NavigationService navigation = NavigationService.instance;
}
