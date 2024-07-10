// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

part of 'book_manage_bloc.dart';

@immutable
sealed class BookManageEvent {}

class InsertBook extends BookManageEvent {
  var image;
  var book_name;
  var book_desc;
  var book_price;
  var book_owner_phone;
  var book_owner_name;
  var book_author;
  var book_owner_email;
  var owner_id;
  var book_owner_address;
  var type;
  var category;
  InsertBook(
      this.image,
      this.book_name,
      this.book_desc,
      this.book_price,
      this.book_owner_phone,
      this.book_owner_name,
      this.book_author,
      this.book_owner_email,
      this.owner_id,
      this.book_owner_address,
      this.type,
      this.category);
}

class DeleteBook extends BookManageEvent {
  var book_id;
  DeleteBook(this.book_id);
}

class FetchMyBooks extends BookManageEvent {}
