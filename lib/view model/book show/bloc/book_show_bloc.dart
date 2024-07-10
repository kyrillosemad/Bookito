import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bookito/services/books/read_all_books_fun.dart';
import 'package:bookito/services/books/read_crime_books_fun.dart';
import 'package:bookito/models/book_model.dart';
import 'package:bookito/services/books/read_educational_books_fun.dart';
import 'package:bookito/services/books/read_fantasy_books_fun.dart';
import 'package:bookito/services/books/read_historical_books_fun.dart';
import 'package:bookito/services/books/read_novel_books_fun.dart';
import 'package:bookito/services/books/read_romantic_books_fun.dart';
import 'package:bookito/services/books/read_science_books_fun.dart';
import 'package:bookito/services/books/read_sports_books_fun.dart';
import 'package:meta/meta.dart';

part 'book_show_event.dart';
part 'book_show_state.dart';

class BookShowBloc extends Bloc<BookShowEvent, BookShowState> {
  BookShowBloc() : super(BookShowInitial()) {
    on<FetchAllBooks>(onFetchAll);
    on<FetchCrimeBooks>(onFetchCrime);
    on<FetchEducationalBooks>(onFetchEducational);
    on<FetchFantasyBooks>(onFetchFantasy);
    on<FetchHistoricalBooks>(onFetchHistorical);
    on<FetchNovelBooks>(onFetchNovel);
    on<FetchRomanticBooks>(onFetchRomantic);
    on<FetchScienceBooks>(onFetchScience);
    on<FetchSportsBooks>(onFetchSports);
  }

  FutureOr<void> _fetchBooks(
    Future<List<BookModel>> Function() fetchFunction,
    String searchQuery,
    Emitter<BookShowState> emit,
    BookShowState Function(List<BookModel>) successState,
  ) async {
    emit(Loading());
    try {
      List<BookModel> books = await fetchFunction();
      if (searchQuery.isNotEmpty) {
        books = books
            .where((book) =>
                book.bookName.toString().toLowerCase().startsWith(searchQuery))
            .toList();
      }
      if (books.isEmpty) {
        emit(Empty());
      } else {
        emit(successState(books));
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  FutureOr<void> onFetchAll(FetchAllBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readAllBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowAllBooks(books),
    );
  }

  FutureOr<void> onFetchCrime(
      FetchCrimeBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readCrimeBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowCrimeBooks(books),
    );
  }

  FutureOr<void> onFetchEducational(
      FetchEducationalBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readEducationalBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowEducationalBooks(books),
    );
  }

  FutureOr<void> onFetchFantasy(
      FetchFantasyBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readFantasyBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowFantasyBooks(books),
    );
  }

  FutureOr<void> onFetchHistorical(
      FetchHistoricalBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readHistoricalBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowHistoricalBooks(books),
    );
  }

  FutureOr<void> onFetchNovel(
      FetchNovelBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readNovelBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowNovelBooks(books),
    );
  }

  FutureOr<void> onFetchRomantic(
      FetchRomanticBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readRomanticBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowRomanticBooks(books),
    );
  }

  FutureOr<void> onFetchScience(
      FetchScienceBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readScienceBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowScienceBooks(books),
    );
  }

  FutureOr<void> onFetchSports(
      FetchSportsBooks event, Emitter<BookShowState> emit) {
    return _fetchBooks(
      readSportsBooksFun,
      event.searchQuery,
      emit,
      (books) => ShowSportsBooks(books),
    );
  }
}
