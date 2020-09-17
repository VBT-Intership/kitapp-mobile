import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import '../../models/books_service_model.dart';

abstract class IBooksService {
  Future<List<BooksModel>> getBooksList();
}
