import 'package:dio/dio.dart';
import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/app/models/response.dart';
import '../../core/constants/enums/http_enums.dart';
import 'base_service.dart';
import './interfaces/IBooksService.dart';

class BooksService extends BaseService implements IBooksService {
  static BooksService _instance;
  static BooksService get instance {
    if (_instance == null) _instance = BooksService._init();
    return _instance;
  }

  BooksService._init();

  Future<List<BooksModel>> getBooksList() async {
    return (await coreDio.fetch<List<BooksModel>, BooksModel>(
            "Categories/GetAll",
            type: HttpTypes.GET,
            parseModel: BooksModel()))
        .data;
  }

  Future<List<BooksModel>> searchBook(String name) async {
    return (await coreDio.fetch<List<BooksModel>, BooksModel>(
            "Books/SearchBook/$name",
            type: HttpTypes.GET,
            parseModel: BooksModel()))
        .data;
  }

  Future<BooksModel> getBookDetail(int userId, int bookId) async {
    return (await coreDio.fetch<BooksModel, BooksModel>(
            "Books/GetBook/0/$bookId",
            type: HttpTypes.GET,
            parseModel: BooksModel()))
        .data;
  }

  Future<List<BooksModel>> getBooksWithCategory(int categoryId) async {
    return (await coreDio.fetch<List<BooksModel>, BooksModel>(
            "Books/GetBookwithCategoryId/$categoryId",
            type: HttpTypes.GET,
            parseModel: BooksModel()))
        .data;
  }

  Future<response> makeComment(
      int userId, int bookId, String comment, double starCount) async {
    FormData formData = FormData.fromMap({
      'usersId': userId,
      'booksId': bookId,
      'comment': comment,
      'UserStarCount': starCount
    });
    response data = (await coreDio.fetch<response, response>(
            "Books/MakeComment",
            type: HttpTypes.POST,
            parseModel: response(),
            data: formData))
        .data;
    return data;
  }

  Future<BooksModel> getBookBarcode(int userId, String barcode) async {
    return (await coreDio.fetch<BooksModel, BooksModel>(
            "/api/Books/GetBookwithISBN/$userId/$barcode",
            type: HttpTypes.GET,
            parseModel: BooksModel()))
        .data;
  }
}
