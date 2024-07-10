// ignore_for_file: library_prefixes, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/constants/urls.dart';
import 'package:bookito/view/modules_view/main%20pages/screens/book%20details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:bookito/view%20model/favorite%20bloc/bloc/favorite_bloc.dart'
    as FavoriteBloc1;

class BookItem extends StatefulWidget {
  final state;
  const BookItem({super.key, required this.state});

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.state.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(() {
                      return const BookDetails();
                    }, arguments: {
                      "name": widget.state[index].bookName,
                      "desc": widget.state[index].bookDesc,
                      "author": widget.state[index].bookAuthor,
                      "type": widget.state[index].type,
                      "price": widget.state[index].bookPrice,
                      "owner_name": widget.state[index].bookOwnerName,
                      "owner_email": widget.state[index].bookOwnerEmail,
                      "owner_phone": widget.state[index].bookOwnerPhone,
                      "owner_address": widget.state[index].bookOwnerAddress,
                      "pic":
                          "http://$server/bookito/img/${widget.state[index].bookPic}",
                      "id": widget.state[index].bookId,
                      "favorite": widget.state[index].favorite,
                      "category": widget.state[index].category,
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: 100.w,
                    margin: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: MyColors().maincolor,
                          offset: const Offset(3, 3),
                          blurRadius: 1,
                          blurStyle: BlurStyle.solid,
                        ),
                        const BoxShadow(
                          color: Colors.black,
                          offset: Offset(-3, -3),
                          blurRadius: 1,
                          blurStyle: BlurStyle.solid,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    ),
                    child: Row(children: [
                      Container(
                        width: 25.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "http://$server/bookito/img/${widget.state[index].bookPic}",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.sp)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.sp),
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(4.sp),
                        width: 60.w,
                        child: Column(
                          children: [
                            Text(
                              "${widget.state[index].bookName}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "${widget.state[index].bookDesc}",
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
                                  "price : ${widget.state[index].bookPrice} \$",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: const Color.fromARGB(
                                        255, 233, 216, 130),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (widget.state[index].favorite == 1) {
                                      context
                                          .read<FavoriteBloc1.FavoriteBloc>()
                                          .add(FavoriteBloc1.DeleteFromFavorite(
                                              widget.state[index].bookId
                                                  .toString()));
                                      setState(() {
                                        widget.state[index].favorite = 0;
                                      });
                                    } else {
                                      context
                                          .read<FavoriteBloc1.FavoriteBloc>()
                                          .add(FavoriteBloc1.AddToFavorite(
                                              widget.state[index].bookId
                                                  .toString()));

                                      setState(() {
                                        widget.state[index].favorite = 1;
                                      });
                                    }
                                  },
                                  child: widget.state[index].favorite == 1
                                      ? Icon(Icons.favorite,
                                          size: 25.sp, color: Colors.red)
                                      : Icon(Icons.favorite_border,
                                          size: 25.sp, color: Colors.black),
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
          )
        ],
      ),
    );
  }
}
