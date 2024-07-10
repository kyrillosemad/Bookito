// ignore_for_file: non_constant_identifier_names, must_be_immutable

part of 'book_manage_bloc.dart';

@immutable
sealed class BookManageState {}

final class BookManageInitial extends BookManageState {}

class Loading extends BookManageState {}

class Empty extends BookManageState {}

class Error extends BookManageState {
  String msg;
  Error(this.msg);
}

class ShowMybooks extends BookManageState {
  List<BookModel> myBooks;
  ShowMybooks(this.myBooks);
}
