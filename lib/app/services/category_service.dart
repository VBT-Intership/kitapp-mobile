import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import '../../core/constants/enums/http_enums.dart';
import 'base_service.dart';
import './interfaces/ICategoryService.dart';

class CategoriesService extends BaseService implements ICategoriesService{
  static CategoriesService _instance;
  static CategoriesService get instance {
    if (_instance == null) _instance = CategoriesService._init();
    return _instance;
  }

  CategoriesService._init();

  Future<List<CategoriesModel>> getCategoryList() async {
    return (await coreDio.fetch<List<CategoriesModel>, CategoriesModel>(
            "Categories/GetAll",
            type: HttpTypes.GET,
            parseModel: CategoriesModel()))
        .data;
  }
}
