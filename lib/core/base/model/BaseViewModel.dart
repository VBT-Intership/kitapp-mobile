import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/init/network/model/ICoreDio.dart';

class BaseViewModel {
  BuildContext context;

  ICoreDio coreDio;
  void setContext(BuildContext context) {
    this.context = context;
  }
  // void init();
}
