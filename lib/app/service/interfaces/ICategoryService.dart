

import 'package:flutterfoodapp/app/models/categories_service_model.dart';

abstract class ICategoriesService {
  Future<List<CategoriesModel>> getCategoryList();
}
