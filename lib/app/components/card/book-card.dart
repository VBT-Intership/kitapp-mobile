import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/core/constants/navigation/navigation_constants.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import '../../../core/extensions/context_entension.dart';
import '../../../core/extensions/string_extension.dart';

class BookCardView extends StatelessWidget {
  final BooksModel book;

  const BookCardView({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        NavigationService.instance.navigateToPage(
            path: NavigationConstants.BOOK_DETAIL_VIEW, data: book.bookId);
      },
      child: Container(
        width: width * 0.30,
        height: height * 0.32,
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, top: 5.0),
          child: Column(
            children: [
              SizedBox(
                width: context.width * 0.3,
                height: height * 0.2,
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      book.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    book.bookName,
                    style: TextStyle(
                        fontSize: 15,
                        color: context.theme.selectedRowColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "by".locale + book.writerName,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                    maxLines: 1,
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RatingBarIndicator(
                  rating: book.bookStarCount,
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
