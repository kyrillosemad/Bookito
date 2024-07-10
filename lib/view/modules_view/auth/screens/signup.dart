import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/auth/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: MyColors().maincolor),
                child: Padding(
                  padding: EdgeInsets.only(top: 7.h, left: 7.w),
                  child: Text(
                    'welcome to \n Bookito',
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
