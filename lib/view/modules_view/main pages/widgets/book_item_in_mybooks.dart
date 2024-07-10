// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bookito/view%20model/my%20book/bloc/book_manage_bloc.dart';
import 'package:bookito/view/constants/urls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyBooksBookItem extends StatelessWidget {
  final state;
  const MyBooksBookItem({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: state.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  foregroundColor: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      bottomLeft: Radius.circular(15.sp)),
                  icon: Icons.delete,
                  label: "Delete",
                  onPressed: (context) async {
                    context
                        .read<BookManageBloc>()
                        .add(DeleteBook(state[index].bookId));
                  },
                  backgroundColor: Colors.white,
                )
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(5.sp),
              width: double.infinity,
              margin: EdgeInsets.all(5.sp),
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
                  borderRadius: BorderRadius.all(Radius.circular(10.sp))),
              child: Row(children: [
                Container(
                  width: 27.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "http://$server/bookito/img/${state[index].bookPic}",
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                ),
                Container(
                  padding: EdgeInsets.all(8.sp),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(4.sp),
                  width: 63.w,
                  child: Column(
                    children: [
                      Text(
                        "${state[index].bookName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "${state[index].bookDesc}",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "price : ${state[index].bookPrice} \$",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color:
                                    const Color.fromARGB(255, 233, 216, 130)),
                          ),
                          Icon(
                            Icons.swipe_left,
                            size: 20.sp,
                            color: Colors.black,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
