import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/book_model.dart';
import 'package:flutterfoodapp/app/models/category_model.dart';
import '../../core/extensions/context_entension.dart';
import 'Book_category_list_builder.dart';
import 'card/book-card.dart';

class CategoryListBuilder extends StatelessWidget {
  final List<Category> categories;

  const CategoryListBuilder({
    Key key,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        Category categoryItem = categories[index];
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(categoryItem.name, style: context.textTheme.headline5),
              Container(
                  width: double.infinity,
                  height: context.height * 0.43,
                  child: BookCategoryListBuilder(books: categoryItem.books))
            ],
          ),
        );
      },
    );
  }
}
