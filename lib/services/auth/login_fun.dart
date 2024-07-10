import 'dart:convert';
import 'package:bookito/main.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/constants/urls.dart';

import 'package:bookito/view/shared_widgets/bottom%20nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

// ignore: non_constant_identifier_names
login_fun(email, password) async {
  var res = await http.post(Uri.parse(loginUrl), body: {
    "user_email": email,
    "user_password": password,
  });
  var res2 = await jsonDecode(res.body);
  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "You have successfully logged in",
        overlayColor: MyColors().maincolor,
        borderColor: MyColors().maincolor,
        borderWidth: 1.sp,
        backgroundColor: Colors.white,
        colorText: MyColors().maincolor);
    id!.setString("userid", res2['data'][0]['user_id'].toString());
    id!.setString("user_name", res2['data'][0]['user_name'].toString());
    id!.setString("user_email", res2['data'][0]['user_email'].toString());
    id!.setString("user_address", res2['data'][0]['user_address'].toString());
    // ignore: avoid_print
    Get.offAll(const BottomNav());
  } else {
    Get.defaultDialog(
      title: "failed !",
      titleStyle: TextStyle(color: MyColors().maincolor),
      cancelTextColor: MyColors().maincolor,
      buttonColor: MyColors().maincolor,
      content: Text(
        "Email or password isn't correct",
        style: TextStyle(color: MyColors().maincolor),
      ),
      confirmTextColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
    );
  }
}
