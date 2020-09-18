import 'package:flutterfoodapp/app/models/response.dart';

import '../../models/books_service_model.dart';

abstract class IBooksService {
  Future<List<BooksModel>> getBooksList();
  Future<List<BooksModel>> searchBook(String name);
  Future<List<BooksModel>> getBooksWithCategory(int categoryId);
  Future<BooksModel> getBookDetail(int userId, int bookId);
  Future<response> makeComment(
      int userId, int bookId, String comment, double starCount);
}
