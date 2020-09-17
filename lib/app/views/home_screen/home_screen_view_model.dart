import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import 'package:flutterfoodapp/app/views/home_screen/home_screen.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';
import '../../services/interfaces/ICategoryService.dart';
import '../../services/category_service.dart';

abstract class HomeScreenViewModel extends State<HomeScreen>
    with BaseViewModel {
  ICategoriesService categoriesService;
  @override
  void initState() {
    super.initState();
    categoriesService = CategoriesService.instance;
    getData();
  }

  Future<void> getData() async {
    List<CategoriesModel> cat = await categoriesService.getCategoryList();
    int a = 5;
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
