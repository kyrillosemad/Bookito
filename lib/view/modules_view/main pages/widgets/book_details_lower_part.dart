import 'package:bookito/view/modules_view/main%20pages/widgets/owner_info_item_part.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:bookito/view/constants/colors.dart';

class BookDetailsLowerPart extends StatelessWidget {
  const BookDetailsLowerPart({super.key});

  @override
  Widget build(BuildContext context) {
    var desc = Get.arguments["desc"];
    var ownerName = Get.arguments["owner_name"];
    var ownerEmail = Get.arguments["owner_email"];
    var ownerPhone = Get.arguments["owner_phone"].toString();
    var ownerAddress = Get.arguments["owner_address"];
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.sp),
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.sp),
              topRight: Radius.circular(40.sp)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "about the book",
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  "$desc",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              Divider(
                color: MyColors().maincolor,
                height: 5.h,
                thickness: 1,
              ),
              Text(
                "owner information",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                padding: EdgeInsets.all(5.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OwnerInfoItemPart(iconName: "name", info: ownerName),
                        OwnerInfoItemPart(
                            iconName: "address", info: ownerAddress)
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OwnerInfoItemPart(iconName: "email", info: ownerEmail),
                        OwnerInfoItemPart(iconName: "phone", info: ownerPhone),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
