import 'package:bookito/view/modules_view/auth/widgets/address_field.dart';
import 'package:bookito/view/modules_view/auth/widgets/email_field.dart';
import 'package:bookito/view/modules_view/auth/widgets/fullname_field.dart';
import 'package:bookito/view/modules_view/auth/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:bookito/services/auth/signup_fun.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/auth/screens/login.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool secure = true;
  GlobalKey<FormState> signup = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signup,
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white,
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Create new account now",
                  style:
                      TextStyle(fontSize: 15.sp, color: MyColors().maincolor),
                ),
                SizedBox(
                  height: 2.h,
                ),
                FullNameField(name: name),
                EmailField(email: email),
                PasswordField(password: password),
                AddressField(address: address),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: () async {
                    if (signup.currentState!.validate()) {
                      await signupFun(
                          email.text, name.text, password.text, address.text);
                    }
                  },
                  child: Container(
                    height: 7.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: MyColors().maincolor),
                    child: const Center(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "already have an account?",
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
                            return const Login();
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
        ),
      )
          .animate()
          .fade()
          .slideY(begin: 1, duration: const Duration(milliseconds: 600)),
    );
  }
}
