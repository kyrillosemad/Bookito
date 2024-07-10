import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 100.w,
      height: 100.h,
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            width: 100.w,
            height: 45.h,
            child: Center(
              child: LottieBuilder.network(
                  "https://lottie.host/fd8d2df1-5a1f-4036-82f5-98ff5dedee00/G2dI67cGKZ.json"),
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
                      "Sell ​​your book",
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
                        "This system provides a book exchange where you can display your own book that you have used for sale or lend it to others",
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
