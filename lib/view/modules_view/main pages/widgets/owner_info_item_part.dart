import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OwnerInfoItemPart extends StatelessWidget {
  final String iconName;
  final String info;
  const OwnerInfoItemPart(
      {super.key, required this.iconName, required this.info});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (iconName) {
      case "phone":
        icon = Icons.phone;
        break;
      case "email":
        icon = Icons.email;
        break;
      case "address":
        icon = Icons.location_on;
        break;
      case "name":
        icon = Icons.person;
        break;
      default:
        icon = Icons.error;
        break;
    }
    return Container(
      padding: EdgeInsets.only(left: 5.sp, right: 5.sp),
      width: 42.w,
      height: 10.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: MyColors().maincolor,
                offset: const Offset(3, 3),
                blurRadius: 1,
                blurStyle: BlurStyle.solid),
            const BoxShadow(
                color: Colors.black,
                offset: Offset(-3, -3),
                blurRadius: 1,
                blurStyle: BlurStyle.solid)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.sp))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: MyColors().maincolor,
            size: 14.sp,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 13.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
