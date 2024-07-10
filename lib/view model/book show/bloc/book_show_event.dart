// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

part of 'book_show_bloc.dart';

@immutable
sealed class BookShowEvent {}

class FetchAllBooks extends BookShowEvent {
  final String searchQuery;
  FetchAllBooks( this.searchQuery);
}

class FetchCrimeBooks extends BookShowEvent {
  final String searchQuery;
  FetchCrimeBooks( this.searchQuery);
}

class FetchEducationalBooks extends BookShowEvent {
  final String searchQuery;
  FetchEducationalBooks( this.searchQuery);
}

class FetchFantasyBooks extends BookShowEvent {
  final String searchQuery;
  FetchFantasyBooks( this.searchQuery);
}

class FetchHistoricalBooks extends BookShowEvent {
  final String searchQuery;
  FetchHistoricalBooks( this.searchQuery);
}


class FetchNovelBooks extends BookShowEvent {
  final String searchQuery;
  FetchNovelBooks(this.searchQuery);
}

class FetchRomanticBooks extends BookShowEvent {
  final String searchQuery;
  FetchRomanticBooks( this.searchQuery);
}

class FetchScienceBooks extends BookShowEvent {
  final String searchQuery;
  FetchScienceBooks( this.searchQuery);
}

class FetchSportsBooks extends BookShowEvent {
  final String searchQuery;
  FetchSportsBooks( this.searchQuery);
}
