class Book {
  final String name;
  final int id;
  final double rating;
  final String urlimage;
  final String author;
  Book({this.name, this.rating, this.urlimage, this.author, this.id});
}

List<Book> dummyBook = [
  Book(
      name: "Bozkurtlarin Dirilisi",
      id: 1,
      urlimage:
          "https://img.kitapyurdu.com/v1/getImage/fn:11240784/wh:true/wi:256/pc:584",
      rating: 5,
      author: "Huseyin Nihal Atsiz"),
  Book(
      name: "Nutuk",
      id: 2,
      urlimage:
          "https://img.kitapyurdu.com/v1/getImage/fn:3259019/wh:true/wi:256/pc:200",
      rating: 5,
      author: "Mustafa Kemal Ataturk"),
  Book(
      name: "Turk Tarihi Uzerinde Toplamalar",
      id: 3,
      urlimage:
          "https://img.kitapyurdu.com/v1/getImage/fn:8766540/wh:true/wi:256/pc:274",
      rating: 5,
      author: "Huseyin Nihal Atsiz"),
  Book(
      name: "Turk Devrimi ve Ataturk Ilkeleri",
      id: 4,
      urlimage:
          "https://img.kitapyurdu.com/v1/getImage/fn:5216/wh:true/wi:256/pc:445",
      rating: 5,
      author: "Mustafa Barut")
];
