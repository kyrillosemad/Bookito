// ignore_for_file: must_be_immutable

part of 'book_show_bloc.dart';

@immutable
sealed class BookShowState {}

final class BookShowInitial extends BookShowState {}

class Loading extends BookShowState {}

class Error extends BookShowState {
  String msg;
  Error(this.msg);
}
class Empty extends BookShowState {}

class ShowAllBooks extends BookShowState {
  final List<BookModel> allBooks;
  ShowAllBooks(this.allBooks);
}

class ShowCrimeBooks extends BookShowState {
  final List<BookModel> crimeBooks;
  ShowCrimeBooks(this.crimeBooks);
}

class ShowEducationalBooks extends BookShowState {
  final List<BookModel> educationalBooks;
  ShowEducationalBooks(this.educationalBooks);
}

class ShowFantasyBooks extends BookShowState {
  final List<BookModel> fantasyBooks;
  ShowFantasyBooks(this.fantasyBooks);
}

class ShowHistoricalBooks extends BookShowState {
  final List<BookModel> historicalBooks;
  ShowHistoricalBooks(this.historicalBooks);
}

class ShowNovelBooks extends BookShowState {
  final List<BookModel> novelBooks;
  ShowNovelBooks(this.novelBooks);
}

class ShowRomanticBooks extends BookShowState {
  final List<BookModel> romanticBooks;
  ShowRomanticBooks(this.romanticBooks);
}

class ShowScienceBooks extends BookShowState {
  final List<BookModel> scienceBooks;
  ShowScienceBooks(this.scienceBooks);
}

class ShowSportsBooks extends BookShowState {
  final List<BookModel> sportsBooks;
  ShowSportsBooks(this.sportsBooks);
}
