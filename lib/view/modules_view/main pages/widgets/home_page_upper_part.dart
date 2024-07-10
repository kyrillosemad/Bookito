// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePageUpperPart extends StatefulWidget {
  final home;
  const HomePageUpperPart({super.key, required this.home});

  @override
  State<HomePageUpperPart> createState() => _HomePageUpperPartState();
}

class _HomePageUpperPartState extends State<HomePageUpperPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      width: 100.w,
      height: 8.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.home.currentState!.openDrawer();
                });
              },
              icon: Icon(
                Icons.menu,
                size: 25.sp,
                color: MyColors().maincolor,
              )),
          Text(
            "Bookito",
            style: TextStyle(
                color: MyColors().maincolor,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
