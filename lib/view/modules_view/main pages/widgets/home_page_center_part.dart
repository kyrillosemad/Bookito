import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePageCenterPart extends StatelessWidget {
  const HomePageCenterPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.sp),
      width: 100.w,
      height: 19.h,
      child: Column(
        children: [
          SizedBox(
              width: 100.w,
              height: 11.h,
              child:
                  AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
                TyperAnimatedText("Discover your best books now",
                    speed: const Duration(milliseconds: 50),
                    textStyle: TextStyle(
                        fontSize: 20.sp, color: MyColors().maincolor)),
                TyperAnimatedText("Exchange books with others",
                    speed: const Duration(milliseconds: 50),
                    textStyle: TextStyle(
                        fontSize: 20.sp, color: MyColors().maincolor)),
                TyperAnimatedText("Display your books for borrowing or sale",
                    speed: const Duration(milliseconds: 50),
                    textStyle: TextStyle(
                        fontSize: 20.sp, color: MyColors().maincolor)),
              ])),
          SizedBox(
            height: 1.h,
          ),
          Text(
            "You can easily find the book you are looking for here among a large library of books",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
