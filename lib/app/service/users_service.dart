import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import 'package:flutterfoodapp/app/models/users_service_model.dart';
import '../../core/constants/enums/http_enums.dart';
import 'base_service.dart';
import './interfaces/IUsersService.dart';

class UsersService extends BaseService implements IUsersService {
  static UsersService _instance;
  static UsersService get instance {
    if (_instance == null) _instance = UsersService._init();
    return _instance;
  }

  UsersService._init();

  Future<UsersModel> login() async {
    return (await coreDio.fetch<UsersModel, UsersModel>(
      "User/Test",
      type: HttpTypes.GET,
      parseModel: UsersModel(),
    ))
        .data;
  }

  Future<UsersModel> register() async {
    return (await coreDio.fetch<UsersModel, UsersModel>("User/Register",
            type: HttpTypes.POST,
            parseModel: UsersModel(),
            data: new UsersModel(
                    adress: "test",
                    name: "hasan",
                    userName: "test",
                    password: "123",
                    phoneNumber: "12412412")
                .toJson()))
        .data;
  }
}
