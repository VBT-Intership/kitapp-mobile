import 'package:flutterfoodapp/app/models/users_service_model.dart';
import 'package:flutterfoodapp/core/base/model/base_model.dart';

import 'books_service_model.dart';

class SellDetailModel implements IBaseModel<SellDetailModel>{
  int sellId;
  int productPrice;
  String publishDate;
  bool isActive;
  int status;
  int offerPrice;
  int bookId;
  BooksModel books;
  int userId;
  UsersModel users;
  List<OfferDetail> offerDetail;

  SellDetailModel(
      {this.sellId,
      this.productPrice,
      this.publishDate,
      this.isActive,
      this.status,
      this.offerPrice,
      this.bookId,
      this.books,
      this.userId,
      this.users,
      this.offerDetail});

  SellDetailModel.fromJson(Map<String, dynamic> json) {
    sellId = json['sellId'];
    productPrice = json['productPrice'];
    publishDate = json['publishDate'];
    isActive = json['isActive'];
    status = json['status'];
    offerPrice = json['offerPrice'];
    bookId = json['bookId'];
    books = json['books'];
    userId = json['userId'];
    users = json['users'];
    if (json['offerDetail'] != null) {
      offerDetail = new List<OfferDetail>();
      json['offerDetail'].forEach((v) {
        offerDetail.add(new OfferDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellId'] = this.sellId;
    data['productPrice'] = this.productPrice;
    data['publishDate'] = this.publishDate;
    data['isActive'] = this.isActive;
    data['status'] = this.status;
    data['offerPrice'] = this.offerPrice;
    data['bookId'] = this.bookId;
    data['books'] = this.books;
    data['userId'] = this.userId;
    data['users'] = this.users;
    if (this.offerDetail != null) {
      data['offerDetail'] = this.offerDetail.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return SellDetailModel.fromJson(json);
  }
}

class OfferDetail {
  int offerDetalId;
  String offerDate;
  int offerStatus;
  int offerUserId;
  int offerPrice;
  int userId;
  UsersModel users;
  int sellDetalId;
  SellDetail sellDetail;

  OfferDetail(
      {this.offerDetalId,
      this.offerDate,
      this.offerStatus,
      this.offerUserId,
      this.offerPrice,
      this.userId,
      this.users,
      this.sellDetalId,
      this.sellDetail});

  OfferDetail.fromJson(Map<String, dynamic> json) {
    offerDetalId = json['offerDetalId'];
    offerDate = json['offerDate'];
    offerStatus = json['offerStatus'];
    offerUserId = json['offerUserId'];
    offerPrice = json['offerPrice'];
    userId = json['userId'];
    users = json['users'];
    sellDetalId = json['sellDetalId'];
    sellDetail = json['sellDetail'] != null
        ? new SellDetail.fromJson(json['sellDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerDetalId'] = this.offerDetalId;
    data['offerDate'] = this.offerDate;
    data['offerStatus'] = this.offerStatus;
    data['offerUserId'] = this.offerUserId;
    data['offerPrice'] = this.offerPrice;
    data['userId'] = this.userId;
    data['users'] = this.users;
    data['sellDetalId'] = this.sellDetalId;
    if (this.sellDetail != null) {
      data['sellDetail'] = this.sellDetail.toJson();
    }
    return data;
  }
}

class SellDetail {
  int sellId;
  int productPrice;
  String publishDate;
  bool isActive;
  int status;
  int offerPrice;
  int bookId;
  BooksModel books;
  int userId;
  UsersModel users;
  OfferDetail offerDetail;

  SellDetail(
      {this.sellId,
      this.productPrice,
      this.publishDate,
      this.isActive,
      this.status,
      this.offerPrice,
      this.bookId,
      this.books,
      this.userId,
      this.users,
      this.offerDetail});

  SellDetail.fromJson(Map<String, dynamic> json) {
    sellId = json['sellId'];
    productPrice = json['productPrice'];
    publishDate = json['publishDate'];
    isActive = json['isActive'];
    status = json['status'];
    offerPrice = json['offerPrice'];
    bookId = json['bookId'];
    books = json['books'];
    userId = json['userId'];
    users = json['users'];
    offerDetail = json['offerDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sellId'] = this.sellId;
    data['productPrice'] = this.productPrice;
    data['publishDate'] = this.publishDate;
    data['isActive'] = this.isActive;
    data['status'] = this.status;
    data['offerPrice'] = this.offerPrice;
    data['bookId'] = this.bookId;
    data['books'] = this.books;
    data['userId'] = this.userId;
    data['users'] = this.users;
    data['offerDetail'] = this.offerDetail;
    return data;
  }
}
