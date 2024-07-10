import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Search extends StatelessWidget {
  final TextEditingController search;
  final Function(String) onchanged;

  const Search({super.key, required this.onchanged, required this.search});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 70.w,
          height: 6.h,
          child: Form(
            child: TextFormField(
              onChanged: onchanged,
              style: TextStyle(color: MyColors().maincolor, fontSize: 12.sp),
              controller: search,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle:
                    TextStyle(color: MyColors().maincolor, fontSize: 12.sp),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 15.sp,
                  color: MyColors().maincolor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Container(
          width: 14.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: MyColors().maincolor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              Icons.filter_list,
              size: 25.sp,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
