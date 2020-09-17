import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import 'package:flutterfoodapp/app/models/users_service_model.dart';
import '../../core/constants/enums/http_enums.dart';
import 'base_service.dart';
import './interfaces/IUsersService.dart';

class UsersService extends BaseService implements IUsersService{
  static UsersService _instance;
  static UsersService get instance {
    if (_instance == null) _instance = UsersService._init();
    return _instance;
  }

  UsersService._init();

  Future<List<UsersModel>> getUsersList() async {
    return (await coreDio.fetch<List<UsersModel>, UsersModel>(
            "Categories/GetAll",
            type: HttpTypes.GET,
            parseModel: UsersModel()))
        .data;
  }
}
