import 'book_model.dart';

class Category {
  final String name;
  final List<Book> books;

  Category({this.books, this.name});
}

List<Category> dummyCategory = [
  Category(name: "Siyaset", books: dummyBook),
  Category(name: "Tarih", books: dummyBook),
  Category(name: "Felsefe", books: dummyBook),
  Category(name: "Bilim Kurgu", books: dummyBook),
  Category(name: "Bilim", books: dummyBook),
  Category(name: "Kisisel Gelisim", books: dummyBook),
];
