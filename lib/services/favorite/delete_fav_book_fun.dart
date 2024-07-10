import 'dart:convert';
import 'package:bookito/view/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<String> deleteFavBookFun(bookId) async {
  var res = await http.post(Uri.parse(deleteFavoriteUrl), body: {"book_id": bookId.toString()});
  var res2 = jsonDecode(res.body);
  if (res.statusCode == 200 && res2['status'] == 'success') {
    return 'success';
  } else {
    return 'failed';
  }
}
