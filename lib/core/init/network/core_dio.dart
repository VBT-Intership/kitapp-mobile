import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/constants/enums/http_enums.dart';

import '../../base/model/base_model.dart';
import 'model/ICoreDio.dart';
import 'model/IResponseModel.dart';
import '../../extensions/http_type_extension.dart';
part "./network_core/core_operations.dart";

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<IResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        R model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("error"));
    }
  }
}
