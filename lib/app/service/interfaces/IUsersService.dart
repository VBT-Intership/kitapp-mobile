import 'package:flutterfoodapp/app/models/categories_service_model.dart';
import 'package:flutterfoodapp/app/models/users_service_model.dart';

abstract class IUsersService {
  Future<UsersModel> login();
  Future<UsersModel> register();
}
