import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bookito/models/book_model.dart';
import 'package:bookito/services/books/delete_book_fun.dart';
import 'package:bookito/services/books/insert_book_fun.dart';
import 'package:bookito/services/books/read_mybooks_fun.dart';
import 'package:meta/meta.dart';

part 'book_manage_event.dart';
part 'book_manage_state.dart';

class BookManageBloc extends Bloc<BookManageEvent, BookManageState> {
  BookManageBloc() : super(BookManageInitial()) {
    on<InsertBook>(onInsertBook);
    on<DeleteBook>(onDeleteBook);
    on<FetchMyBooks>(onFetchMyBooks);
  }

  FutureOr<void> onInsertBook(
      InsertBook event, Emitter<BookManageState> emit) async {
    await insertBookFun(
        event.image,
        event.book_name,
        event.book_desc,
        event.book_price,
        event.book_owner_phone,
        event.book_owner_name,
        event.book_author,
        event.book_owner_email,
        event.owner_id,
        event.book_owner_address,
        event.type,
        event.category);
    emit(Loading());
    try {
      List<BookModel> myBooks = await readMyBooksFun();
      emit(ShowMybooks(myBooks));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  FutureOr<void> onDeleteBook(
      DeleteBook event, Emitter<BookManageState> emit) async {
    await deleteBookFun(event.book_id);
    emit(Loading());
    try {
      List<BookModel> myBooks = await readMyBooksFun();
      emit(ShowMybooks(myBooks));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  Future<FutureOr<void>> onFetchMyBooks(
      FetchMyBooks event, Emitter<BookManageState> emit) async {
    emit(Loading());
    try {
      List<BookModel> myBooks = await readMyBooksFun();
      if (myBooks.isEmpty) {
        emit(Empty());
      } else {
        emit(ShowMybooks(myBooks));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
