import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/books_service_model.dart';

import 'card/book-card.dart';

class BookCategoryListBuilder extends StatelessWidget {
  final List<BooksModel> books;

  const BookCategoryListBuilder({
    Key key,
    @required this.books,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        BooksModel bookitem = books[index];
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BookCardView(book: bookitem)],
          ),
        );
      },
    );
  }
}
