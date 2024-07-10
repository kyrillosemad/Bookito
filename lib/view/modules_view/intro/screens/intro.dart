import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/auth/screens/signup.dart';
import 'package:bookito/view/modules_view/intro/widgets/page1.dart';
import 'package:bookito/view/modules_view/intro/widgets/page2.dart';
import 'package:bookito/view/modules_view/intro/widgets/page3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  PageController pageCon = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.topRight,
        children: [
          PageView(
            controller: pageCon,
            onPageChanged: (value) {
              if (value == 2) {
                setState(() {
                  lastPage = true;
                });
              } else {
                setState(() {
                  lastPage = false;
                });
              }
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              alignment: const Alignment(0, 0.90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      activeDotColor: const Color.fromARGB(255, 233, 216, 130),
                      dotHeight: 7.sp,
                      dotColor: MyColors().maincolor,
                    ),
                    controller: pageCon,
                    count: 3,
                  ),
                  lastPage == true
                      ? CircleAvatar(
                          backgroundColor: MyColors().maincolor,
                          radius: 20.sp,
                          child: InkWell(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                            onTap: () {
                              Get.offAll(() {
                                return const Signup();
                              });
                            },
                          ),
                        )
                      : CircleAvatar(
                          backgroundColor: MyColors().maincolor,
                          radius: 20.sp,
                          child: InkWell(
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                            onTap: () {
                              pageCon.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            },
                          ),
                        ),
                ],
              )),
          SizedBox(
            width: 20.w,
            height: 10.h,
            child: Center(
              child: InkWell(
                child: Text(
                  "Skip",
                  style:
                      TextStyle(fontSize: 13.sp, color: MyColors().maincolor),
                ),
                onTap: () {
                  Get.offAll(() {
                    return const Signup();
                  });
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
