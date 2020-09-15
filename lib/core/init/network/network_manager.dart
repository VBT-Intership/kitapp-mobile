import 'package:dio/dio.dart';
import 'model/ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://hasansahin.net/api/",
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);
  }
}
