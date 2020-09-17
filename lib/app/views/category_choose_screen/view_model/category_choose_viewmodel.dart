import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/init/navigation/navigation_service.dart';

import '../view/category_choose.dart';

abstract class CategoryChooseViewModel extends State<CategoryChoose>
    with BaseViewModel {}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
