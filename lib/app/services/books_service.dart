import 'package:flutterfoodapp/app/models/books_service_model.dart';
import '../../core/constants/enums/http_enums.dart';
import 'base_service.dart';
import './interfaces/IBooksService.dart';

class BooksService extends BaseService implements IBooksService{
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
}
