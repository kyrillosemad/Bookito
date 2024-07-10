import 'package:bookito/main.dart';
import 'package:bookito/view/modules_view/auth/screens/login.dart';
import 'package:get/get.dart';

logoutFun() {
  id!.clear();
  Get.offAll(const Login());
}
