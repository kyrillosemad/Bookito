import 'package:bookito/main.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:bookito/view/modules_view/categories/screens/crime.dart';
import 'package:bookito/view/modules_view/categories/screens/educational.dart';
import 'package:bookito/view/modules_view/categories/screens/fantasy.dart';
import 'package:bookito/view/modules_view/categories/screens/historical.dart';
import 'package:bookito/view/modules_view/categories/screens/novel.dart';
import 'package:bookito/view/modules_view/categories/screens/romantic.dart';
import 'package:bookito/view/modules_view/categories/screens/science.dart';
import 'package:bookito/view/modules_view/categories/screens/sports.dart';

class DrawerPart extends StatelessWidget {
  const DrawerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 50.w,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPictureSize: Size(23.sp, 23.sp),
              decoration: BoxDecoration(color: MyColors().maincolor),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "${id!.getString("user_name")?.substring(0, 2)}",
                  style: TextStyle(color: MyColors().maincolor),
                ),
              ),
              accountName: Text(
                "${id!.getString("user_name")}",
                style: TextStyle(fontSize: 11.sp),
              ),
              accountEmail: Text(
                "${id!.getString("user_email")}",
                style: TextStyle(fontSize: 11.sp),
              )),
          SizedBox(
            height: 1.h,
          ),
          Container(
            padding: EdgeInsets.all(5.sp),
            width: 100.w,
            height: 50.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 16.sp, color: MyColors().maincolor),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 30.sp,
                      color: MyColors().maincolor,
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Science();
                              });
                            },
                            child: Text(
                              "Science",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Historical();
                              });
                            },
                            child: Text(
                              "Historical",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Novel();
                              });
                            },
                            child: Text(
                              "Novel",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Fantasy();
                              });
                            },
                            child: Text(
                              "Fantasy",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Romantic();
                              });
                            },
                            child: Text(
                              "Romantic",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Crime();
                              });
                            },
                            child: Text(
                              "Crime",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Educational();
                              });
                            },
                            child: Text(
                              "Educational",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.arrow_forward_ios_outlined),
                          SizedBox(
                            width: 2.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.offAll(() {
                                return const Sports();
                              });
                            },
                            child: Text(
                              "Sports",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
