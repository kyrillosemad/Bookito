import 'dart:convert';
import 'package:bookito/view/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../view/constants/colors.dart';

Future<bool> deleteBookFun(bookIdd) async {
  var res = await http
      .post(Uri.parse(deleteBookUrl), body: {"book_id": bookIdd.toString()});
  var res2 = jsonDecode(res.body);
  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "deleted successfully",
        overlayColor: MyColors().maincolor,
        borderColor: MyColors().maincolor,
        borderWidth: 1.sp,
        backgroundColor: Colors.white,
        colorText: MyColors().maincolor);
    return true;
  } else {
    Get.snackbar("failed", "try again ");
    return false;
  }
}
