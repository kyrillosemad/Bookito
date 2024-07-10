import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/auth/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: const LoginForm(),
                ),
              ).animate().fade().slideY(
                  begin: 1, duration: const Duration(milliseconds: 600)),
            ],
          ),
        ),
      ),
    );
  }
}
