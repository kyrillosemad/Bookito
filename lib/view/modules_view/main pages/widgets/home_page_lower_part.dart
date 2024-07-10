// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bookito/view%20model/book%20show/bloc/book_show_bloc.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/shared_widgets/book_item.dart';
import 'package:bookito/view/shared_widgets/search_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePageLowerPart extends StatelessWidget {
  final home;
  final search;
  final event;
  const HomePageLowerPart(
      {super.key,
      required this.home,
      required this.search,
      required this.event});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 60.h,
      child: Column(
        children: [
          SizedBox(
            width: 95.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All books",
                  style: TextStyle(fontSize: 17.sp),
                ),
                InkWell(
                  onTap: () {
                    home.currentState!.openDrawer();
                  },
                  child: Text(
                    "For more",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors().maincolor,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Search(
            onchanged: (value) {
              context.read<BookShowBloc>().add(FetchAllBooks(value.toString()));
            },
            search: search,
          ),
          BlocBuilder<BookShowBloc, BookShowState>(
            builder: (context, state) {
              if (state is Loading) {
                return SizedBox(
                  width: 100.w,
                  height: 47.h,
                  child: Center(
                    child: CircularProgressIndicator(
                        backgroundColor: MyColors().maincolor),
                  ),
                );
              } else if (state is Error) {
                return Expanded(
                  child: Center(
                    child: Text(
                      state.msg,
                      style: TextStyle(
                          fontSize: 20.sp, color: MyColors().maincolor),
                    ),
                  ),
                );
              } else if (state is ShowAllBooks) {
                return BookItem(state: state.allBooks);
              } else if (state is Empty) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "there's no books !",
                      style: TextStyle(
                          fontSize: 20.sp, color: MyColors().maincolor),
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: Text(
                      "unknown state",
                      style: TextStyle(
                          fontSize: 20.sp, color: MyColors().maincolor),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
