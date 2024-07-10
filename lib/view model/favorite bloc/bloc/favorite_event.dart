// ignore_for_file: must_be_immutable

part of 'favorite_bloc.dart';

@immutable
sealed class FavoriteEvent {}

class AddToFavorite extends FavoriteEvent {
  String bookId;
  AddToFavorite(this.bookId);
}

class DeleteFromFavorite extends FavoriteEvent {
  String bookId;
  DeleteFromFavorite(this.bookId);
}

class FetchAllFavorite extends FavoriteEvent {}
