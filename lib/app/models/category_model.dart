import 'book_model.dart';

class Category {
  final String name;
  final List<Book> books;

  Category({this.books, this.name});
}

List<Category> dummyCategory = [
  Category(name: "Politics", books: dummyBook),
  Category(name: "History", books: dummyBook),
  Category(name: "Philosopy", books: dummyBook),
  Category(name: "Sci-fi", books: dummyBook),
  Category(name: "Cookery", books: dummyBook),
  Category(name: "Children", books: dummyBook),
];
