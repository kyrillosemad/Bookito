// ignore_for_file: must_be_immutable

part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class Loading extends FavoriteState {}

class Empty extends FavoriteState {}

class Error extends FavoriteState {
  String msg;
  Error(this.msg);
}

class ShowFavoriteBooks extends FavoriteState {
  List<BookModel> favoriteBooks;
  ShowFavoriteBooks(this.favoriteBooks);
}
