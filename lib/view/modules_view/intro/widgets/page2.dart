import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
                  "https://lottie.host/097e640f-e03d-4771-80e4-99cf0988b85d/293QsehRr9.json"),
            ),
          ),
          SizedBox(
            width: 100.w,
            height: 35.h,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Get the books",
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
                        "We provide you with the largest book exchange library where you can get the book you like from others, whether by borrowing or buying.",
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
