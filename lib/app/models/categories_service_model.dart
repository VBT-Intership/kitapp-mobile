import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/app/models/users_service_model.dart';
import 'package:flutterfoodapp/core/base/model/base_model.dart';

class CategoriesModel implements IBaseModel<CategoriesModel> {
  int id;
  String categoryName;
  String categoryDetail;
  String photoUrl;
  int totalItem;
  List<BooksModel> books;
  List<UserFavorites> userFavorites;

  CategoriesModel(
      {this.id,
      this.categoryName,
      this.categoryDetail,
      this.photoUrl,
      this.totalItem,
      this.books,
      this.userFavorites});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    categoryDetail = json['categoryDetail'];
    photoUrl = json['photoUrl'];
    totalItem = json['totalItem'];
    if (json['books'] != null) {
      books = new List<BooksModel>();
      json['books'].forEach((v) {
        books.add(new BooksModel.fromJson(v));
      });
    }
    if (json['userFavorites'] != null) {
      userFavorites = new List<UserFavorites>();
      json['userFavorites'].forEach((v) {
        userFavorites.add(new UserFavorites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['categoryDetail'] = this.categoryDetail;
    data['photoUrl'] = this.photoUrl;
    data['totalItem'] = this.totalItem;
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    if (this.userFavorites != null) {
      data['userFavorites'] =
          this.userFavorites.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return CategoriesModel.fromJson(json);
  }
}
