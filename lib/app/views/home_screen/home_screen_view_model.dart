import 'package:flutter/material.dart';
import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import 'package:flutterfoodapp/app/service/category_service.dart';
import 'package:flutterfoodapp/app/service/interfaces/ICategoryService.dart';
import 'package:flutterfoodapp/app/views/home_screen/home_screen.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

abstract class HomeScreenViewModel extends State<HomeScreen>
    with BaseViewModel {
  ICategoriesService categoryService;
  Future<List<CategoriesModel>> categoriesdata;
  @override
  void initState() {
    super.initState();
    categoryService = CategoriesService.instance;
    //getdata();
  }

  Future<void> getdata() async {
    categoriesdata = categoryService.getCategoryList();
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
