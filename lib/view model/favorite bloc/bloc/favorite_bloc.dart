import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookito/models/book_model.dart';
import 'package:bookito/services/favorite/delete_fav_book_fun.dart';
import 'package:bookito/services/favorite/insert_favorite_book_fun.dart';
import 'package:bookito/services/favorite/read_favorite_books_fun.dart';
import 'package:meta/meta.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<AddToFavorite>(onAddToFavorite);
    on<DeleteFromFavorite>(onDeleteFromFavorite);
    on<FetchAllFavorite>(onFetchAllFavorite);
  }

  FutureOr<void> onAddToFavorite(
      AddToFavorite event, Emitter<FavoriteState> emit) async {
    try {
      await insertFavBookFun(event.bookId);
      List<BookModel> favoriteBooks = await readFavoriteBooksFun();
      emit(ShowFavoriteBooks(favoriteBooks));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  FutureOr<void> onDeleteFromFavorite(
      DeleteFromFavorite event, Emitter<FavoriteState> emit) async {
    try {
      await deleteFavBookFun(event.bookId);
      List<BookModel> favoriteBooks = await readFavoriteBooksFun();
      emit(ShowFavoriteBooks(favoriteBooks));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  FutureOr<void> onFetchAllFavorite(
      FetchAllFavorite event, Emitter<FavoriteState> emit) async {
    emit(Loading());
    try {
      List<BookModel> favoriteBooks = await readFavoriteBooksFun();
      if (favoriteBooks.isEmpty) {
        emit(Empty());
      } else {
        emit(ShowFavoriteBooks(favoriteBooks));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
