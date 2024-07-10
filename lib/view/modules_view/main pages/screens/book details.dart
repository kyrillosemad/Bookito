// ignore_for_file: file_names
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/main%20pages/widgets/book_details_lower_part.dart';
import 'package:bookito/view/modules_view/main%20pages/widgets/book_details_upper_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  var id = Get.arguments["id"];
  var name = Get.arguments["name"];
  var desc = Get.arguments["desc"];
  var author = Get.arguments["author"];
  var type = Get.arguments["type"];
  var price = Get.arguments["price"];
  var ownerName = Get.arguments["owner_name"];
  var ownerEmail = Get.arguments["owner_email"];
  var ownerPhone = Get.arguments["owner_phone"];
  var ownerAddress = Get.arguments["owner_address"];
  var pic = Get.arguments["pic"];
  var favorite = Get.arguments["favorite"];
  var category = Get.arguments['category'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().maincolor,
      body: SafeArea(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: const Column(
            children: [
              BookDetailsUpperPArt(),
              BookDetailsLowerPart(),
            ],
          ),
        ),
      ),
    );
  }
}
