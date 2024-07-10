import 'package:bookito/view/modules_view/auth/widgets/email_field.dart';
import 'package:bookito/view/modules_view/auth/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:bookito/services/auth/login_fun.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/auth/screens/signup.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool secure = true;
  GlobalKey<FormState> login = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: login,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Sign in now!",
              style: TextStyle(fontSize: 15.sp, color: MyColors().maincolor),
            ),
            SizedBox(
              height: 4.h,
            ),
            EmailField(email: email),
            PasswordField(password: password),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: MyColors().maincolor,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                if (login.currentState!.validate()) {
                  login_fun(email.text, password.text);
                }
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: MyColors().maincolor),
                child: const Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(() {
                        return const Signup();
                      });
                    },
                    child: Text(
                      "click here",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: MyColors().maincolor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
