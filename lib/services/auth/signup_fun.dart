import 'dart:convert';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/constants/urls.dart';
import 'package:bookito/view/modules_view/auth/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

signupFun(userEmail, userName, userPassword, userAddress) async {
  var res = await http.post(
      Uri.parse(
        signupUrl,
      ),
      body: {
        "user_email": userEmail,
        "user_name": userName,
        "user_password": userPassword,
        "user_address": userAddress,
      });

  var res2 = await jsonDecode(res.body);

  if (res.statusCode == 200 && res2['status'] == 'success') {
    Get.snackbar("Done", "You have successfully create an account",
        overlayColor: MyColors().maincolor,
        borderColor: MyColors().maincolor,
        borderWidth: 1.sp,
        backgroundColor: Colors.white,
        colorText: MyColors().maincolor);
    // ignore: avoid_print
    Get.offAll(const Login());
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
