import 'dart:convert';
import 'package:bookito/view/constants/shared.dart';
import 'package:bookito/view/constants/urls.dart';
import 'package:http/http.dart' as http;

Future<String> insertFavBookFun(favBookId) async {
  var res = await http.post(Uri.parse(addFavoriteUrl),
      body: {"fav_book_id": favBookId.toString(), "fav_owner_id": userId});
  var res2 = jsonDecode(res.body);
  if (res.statusCode == 200 && res2['status'] == 'success') {
    return 'success';
  } else {
    return 'failed';
  }
}
