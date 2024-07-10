import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/shared_widgets/bottom%20nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TopTitle extends StatelessWidget {
  final String title;
  const TopTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        IconButton(
            onPressed: () {
              Get.offAll(() {
                return const BottomNav();
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 13.sp,
            )),
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, color: MyColors().maincolor),
        ),
      ]),
      Icon(
        Icons.menu_book,
        size: 30.sp,
        color: MyColors().maincolor,
      )
    ]);
  }
}
