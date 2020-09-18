import 'package:flutterfoodapp/app/models/books_service_model.dart';
import 'package:flutterfoodapp/core/base/model/base_model.dart';

import 'sell_detail_service_model.dart';
import 'books_service_model.dart';

class UsersModel implements IBaseModel<UsersModel>{
  int id;
  String name;
  String userName;
  String email;
  String token;
  String iDate;
  String refreshToken;
  bool isActive;
  String adress;
  String phoneNumber;
  String password;
  List<UserFavorites> userFavorites;
  List<UserFavoritesCategories> userFavoritesCategories;
  List<UserStars> userStars; //???????????????????????????????? Stars
  List<SellDetail> sellDetail;
  List<OfferDetail> offerDetail;
  Comments comments;

  UsersModel(
      {this.id,
      this.name,
      this.userName,
      this.email,
      this.token,
      this.iDate,
      this.refreshToken,
      this.isActive,
      this.adress,
      this.phoneNumber,
      this.password,
      this.userFavorites,
      this.userFavoritesCategories,
      this.userStars,
      this.sellDetail,
      this.offerDetail,
      this.comments});

  UsersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    email = json['email'];
    token = json['token'];
    iDate = json['iDate'];
    refreshToken = json['refreshToken'];
    isActive = json['isActive'];
    adress = json['adress'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    if (json['userFavorites'] != null) {
      userFavorites = new List<UserFavorites>();
      json['userFavorites'].forEach((v) {
        userFavorites.add(new UserFavorites.fromJson(v));
      });
    }
    if (json['userFavoritesCategories'] != null) {
      userFavoritesCategories = new List<UserFavoritesCategories>();
      json['userFavoritesCategories'].forEach((v) {
        userFavoritesCategories.add(new UserFavoritesCategories.fromJson(v));
      });
    }
    if (json['userStars'] != null) {
      userStars = new List<Null>();
      json['userStars'].forEach((v) {
        userStars.add(new UserStars.fromJson(v));
      });
    }
    if (json['sellDetail'] != null) {
      sellDetail = new List<Null>();
      json['sellDetail'].forEach((v) {
        sellDetail.add(new SellDetail.fromJson(v));
      });
    }
    if (json['offerDetail'] != null) {
      offerDetail = new List<Null>();
      json['offerDetail'].forEach((v) {
        offerDetail.add(new OfferDetail.fromJson(v));
      });
    }
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['token'] = this.token;
    data['iDate'] = this.iDate;
    data['refreshToken'] = this.refreshToken;
    data['isActive'] = this.isActive;
    data['adress'] = this.adress;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    if (this.userFavorites != null) {
      data['userFavorites'] =
          this.userFavorites.map((v) => v.toJson()).toList();
    }
    if (this.userFavoritesCategories != null) {
      data['userFavoritesCategories'] =
          this.userFavoritesCategories.map((v) => v.toJson()).toList();
    }
    if (this.userStars != null) {
      data['userStars'] = this.userStars.map((v) => v.toJson()).toList();
    }
    if (this.sellDetail != null) {
      data['sellDetail'] = this.sellDetail.map((v) => v.toJson()).toList();
    }
    if (this.offerDetail != null) {
      data['offerDetail'] = this.offerDetail.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return UsersModel.fromJson(json);
  }
}

class UserFavorites {
  int id;
  int bookId;
  Null books;
  int userId;
  Null users;

  UserFavorites({this.id, this.bookId, this.books, this.userId, this.users});

  UserFavorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    books = json['books'];
    userId = json['userId'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bookId'] = this.bookId;
    data['books'] = this.books;
    data['userId'] = this.userId;
    data['users'] = this.users;
    return data;
  }
}

class UserFavoritesCategories {
  int id;
  int categoryId;
  Null category;
  int userId;
  Null users;

  UserFavoritesCategories(
      {this.id, this.categoryId, this.category, this.userId, this.users});

  UserFavoritesCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    category = json['category'];
    userId = json['userId'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    data['userId'] = this.userId;
    data['users'] = this.users;
    return data;
  }
}
