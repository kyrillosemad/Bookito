import 'dart:convert';
import 'package:bookito/models/book_model.dart';
import 'package:bookito/view/constants/shared.dart';
import 'package:bookito/view/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<List<BookModel>> readEducationalBooksFun() async {
   var res = await http
      .post(Uri.parse(readEducationalBooksUrl), body: {"owner_id": userId});

  if (res.statusCode == 200) {
    var res2 = jsonDecode(res.body);

    if (res2 != null && res2['data'] != null) {
      List<dynamic> data = res2['data'];
      List<BookModel> books =
          data.map((json) => BookModel.fromJson(json)).toList();
      return books;
    } else {
      return [];
    }
  } else {
    throw Exception("Failed to load books");
  }
}
