import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/constants/urls.dart';
import 'package:bookito/view/shared_widgets/bottom%20nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

Future insertBookFun(
    image,
    bookName,
    bookDesc,
    bookPrice,
    bookOwnerPhone,
    bookOwnerName,
    bookAuthor,
    bookOwnerEmail,
    ownerId,
    bookOwnerAddress,
    type,
    category) async {
  var req = http.MultipartRequest("post", Uri.parse(insertBookUrl));
  var pic = await http.MultipartFile.fromPath("book_img", image!.path);
  req.fields['book_name'] = bookName;
  req.fields['book_desc'] = bookDesc;
  req.fields['book_price'] = bookPrice;
  req.fields['book_owner_phone'] = bookOwnerPhone;
  req.fields['book_owner_name'] = bookOwnerName;
  req.fields['book_author'] = bookAuthor;
  req.fields['book_owner_email'] = bookOwnerEmail;
  req.fields['owner_id'] = ownerId;
  req.fields['book_owner_address'] = bookOwnerAddress;
  req.fields['type'] = type;
  req.fields['category'] = category;
  req.files.add(pic);
  var res = await req.send();
  if (res.statusCode == 200) {
    Get.snackbar("Done", "inserted successfully",
        overlayColor: MyColors().maincolor,
        borderColor: MyColors().maincolor,
        borderWidth: 1.sp,
        backgroundColor: Colors.white,
        colorText: MyColors().maincolor);
    Get.offAll(const BottomNav());
  } else {
    Get.snackbar("failed", "try again ");
  }
}
