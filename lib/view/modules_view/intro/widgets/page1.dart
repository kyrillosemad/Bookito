import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100.w,
      height: 100.h,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 100.w,
            height: 50.h,
            child: Center(
              child: LottieBuilder.network(
                  "https://lottie.host/5b391032-780f-4cea-bd75-d3dcc56ad7c7/ZkEJy4PuOI.json"),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 100.w,
            height: 35.h,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Find your book",
                      style: TextStyle(
                          color: MyColors().maincolor,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      width: 90.w,
                      child: Text(
                        "You can easily find the book you are looking for here among a large library of books",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.sp, color: MyColors().maincolor),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
