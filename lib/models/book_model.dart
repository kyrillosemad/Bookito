class BookModel {
  int? bookId;
  String? bookName;
  String? bookDesc;
  int? bookPrice;
  String? bookPic;
  int? bookOwnerPhone;
  String? bookOwnerName;
  String? bookAuthor;
  String? bookOwnerEmail;
  int? ownerId;
  String? bookOwnerAddress;
  String? type;
  String? category;
  int? favorite;

  BookModel(
      {this.bookId,
      this.bookName,
      this.bookDesc,
      this.bookPrice,
      this.bookPic,
      this.bookOwnerPhone,
      this.bookOwnerName,
      this.bookAuthor,
      this.bookOwnerEmail,
      this.ownerId,
      this.bookOwnerAddress,
      this.type,
      this.category,
      this.favorite});

  BookModel.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookName = json['book_name'];
    bookDesc = json['book_desc'];
    bookPrice = json['book_price'];
    bookPic = json['book_pic'];
    bookOwnerPhone = json['book_owner_phone'];
    bookOwnerName = json['book_owner_name'];
    bookAuthor = json['book_author'];
    bookOwnerEmail = json['book_owner_email'];
    ownerId = json['owner_id'];
    bookOwnerAddress = json['book_owner_address'];
    type = json['type'];
    category = json['category'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['book_id'] = bookId;
    data['book_name'] = bookName;
    data['book_desc'] = bookDesc;
    data['book_price'] = bookPrice;
    data['book_pic'] = bookPic;
    data['book_owner_phone'] = bookOwnerPhone;
    data['book_owner_name'] = bookOwnerName;
    data['book_author'] = bookAuthor;
    data['book_owner_email'] = bookOwnerEmail;
    data['owner_id'] = ownerId;
    data['book_owner_address'] = bookOwnerAddress;
    data['type'] = type;
    data['category'] = category;
    data['favorite'] = favorite;
    return data;
  }
}
