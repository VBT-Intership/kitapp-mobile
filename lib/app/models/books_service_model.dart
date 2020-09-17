//--books
//users model
//categories model

//---comment
//books
//users

//--userStars
// Null books;
//   Null userStars;
//   Null users;
import 'package:flutterfoodapp/core/base/model/base_model.dart';
import 'categories_service_model.dart';
import 'users_service_model.dart';
class BooksModel implements IBaseModel<BooksModel>{
  int bookId;
  String bookName;
  String bookDetail;
  String isbn;
  String imageUrl;
  String categoryOfBook;
  String publishedTime;
  int editionNumber;
  int printNumber;
  String language;
  String coverType;
  String typeofPaper;
  String writerName;
  int bookStarCount;
  bool isUserFavorite;
  int userStarCount;
  List<Comments> comments;
  List<UserStars> userStars; //???????????????????????????????? Stars
  int categoryId;
  CategoriesModel categories;

  BooksModel(
      {this.bookId,
      this.bookName,
      this.bookDetail,
      this.isbn,
      this.imageUrl,
      this.categoryOfBook,
      this.publishedTime,
      this.editionNumber,
      this.printNumber,
      this.language,
      this.coverType,
      this.typeofPaper,
      this.writerName,
      this.bookStarCount,
      this.isUserFavorite,
      this.userStarCount,
      this.comments,
      this.userStars,
      this.categoryId,
      this.categories});

  BooksModel.fromJson(Map<String, dynamic> json) {
    bookId = json['bookId'];
    bookName = json['bookName'];
    bookDetail = json['bookDetail'];
    isbn = json['isbn'];
    imageUrl = json['imageUrl'];
    categoryOfBook = json['categoryOfBook'];
    publishedTime = json['publishedTime'];
    editionNumber = json['editionNumber'];
    printNumber = json['printNumber'];
    language = json['language'];
    coverType = json['coverType'];
    typeofPaper = json['typeofPaper'];
    writerName = json['writerName'];
    bookStarCount = json['bookStarCount'];
    isUserFavorite = json['isUserFavorite'];
    userStarCount = json['userStarCount'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    if (json['userStars'] != null) {
      userStars = new List<UserStars>();
      json['userStars'].forEach((v) {
        userStars.add(new UserStars.fromJson(v));
      });
    }
    categoryId = json['categoryId'];
    categories = json['categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookId'] = this.bookId;
    data['bookName'] = this.bookName;
    data['bookDetail'] = this.bookDetail;
    data['isbn'] = this.isbn;
    data['imageUrl'] = this.imageUrl;
    data['categoryOfBook'] = this.categoryOfBook;
    data['publishedTime'] = this.publishedTime;
    data['editionNumber'] = this.editionNumber;
    data['printNumber'] = this.printNumber;
    data['language'] = this.language;
    data['coverType'] = this.coverType;
    data['typeofPaper'] = this.typeofPaper;
    data['writerName'] = this.writerName;
    data['bookStarCount'] = this.bookStarCount;
    data['isUserFavorite'] = this.isUserFavorite;
    data['userStarCount'] = this.userStarCount;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    if (this.userStars != null) {
      data['userStars'] = this.userStars.map((v) => v.toJson()).toList();
    }
    data['categoryId'] = this.categoryId;
    data['categories'] = this.categories;
    return data;
  }

 @override
  fromJson(Map<String, Object> json) {
    return BooksModel.fromJson(json);
  }
}

class Comments {
  int commentId;
  String comment;
  String publisDate;
  bool isFavorite;
  bool isActive;
  int userStarCount;
  int bookId;
  BooksModel books;
  int userId;
  UsersModel users;

  Comments(
      {this.commentId,
      this.comment,
      this.publisDate,
      this.isFavorite,
      this.isActive,
      this.userStarCount,
      this.bookId,
      this.books,
      this.userId,
      this.users});

  Comments.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    comment = json['comment'];
    publisDate = json['publisDate'];
    isFavorite = json['isFavorite'];
    isActive = json['isActive'];
    userStarCount = json['userStarCount'];
    bookId = json['bookId'];
    books = json['books'];
    userId = json['userId'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['comment'] = this.comment;
    data['publisDate'] = this.publisDate;
    data['isFavorite'] = this.isFavorite;
    data['isActive'] = this.isActive;
    data['userStarCount'] = this.userStarCount;
    data['bookId'] = this.bookId;
    data['books'] = this.books;
    data['userId'] = this.userId;
    data['users'] = this.users;
    return data;
  }
}

class UserStars {
  int id;
  int starCount;
  String publishDate;
  bool isActive;
  int bookId;
  BooksModel books;
  //???????????????????????????????? Stars
  int userId;
  UsersModel users;

  UserStars(
      {this.id,
      this.starCount,
      this.publishDate,
      this.isActive,
      this.bookId,
      this.books,
      this.userId,
      this.users});

  UserStars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    starCount = json['starCount'];
    publishDate = json['publishDate'];
    isActive = json['isActive'];
    bookId = json['bookId'];
    books = json['books'];
    userId = json['userId'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['starCount'] = this.starCount;
    data['publishDate'] = this.publishDate;
    data['isActive'] = this.isActive;
    data['bookId'] = this.bookId;
    data['books'] = this.books;
    data['userId'] = this.userId;
    data['users'] = this.users;
    return data;
  }
}
