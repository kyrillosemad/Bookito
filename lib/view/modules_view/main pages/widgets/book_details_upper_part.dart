// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bookito/view%20model/favorite%20bloc/bloc/favorite_bloc.dart'
    as FavoriteBloc;
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/shared_widgets/bottom%20nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BookDetailsUpperPArt extends StatefulWidget {
  const BookDetailsUpperPArt({super.key});

  @override
  State<BookDetailsUpperPArt> createState() => _BookDetailsUpperPArtState();
}

class _BookDetailsUpperPArtState extends State<BookDetailsUpperPArt> {
  var id = Get.arguments["id"];
  var name = Get.arguments["name"];
  var author = Get.arguments["author"];
  var type = Get.arguments["type"];
  var price = Get.arguments["price"];
  var pic = Get.arguments["pic"];
  var favorite = Get.arguments["favorite"];
  var category = Get.arguments['category'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      color: MyColors().maincolor,
      width: 100.w,
      height: 40.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.offAll(() {
                    return const BottomNav();
                  });
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
              InkWell(
                  onTap: () {
                    if (favorite == 1) {
                      context
                          .read<FavoriteBloc.FavoriteBloc>()
                          .add(FavoriteBloc.DeleteFromFavorite(id.toString()));
                      setState(() {
                        favorite = 0;
                      });
                    } else {
                      context
                          .read<FavoriteBloc.FavoriteBloc>()
                          .add(FavoriteBloc.AddToFavorite(id.toString()));

                      setState(() {
                        favorite = 1;
                      });
                    }
                  },
                  child: favorite == 1
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 33.sp,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 33.sp,
                        )),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 90.w,
            height: 24.h,
            child: Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 35.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            pic,
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                      width: 45.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "$name",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "$author",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            "$category",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            "for: $type",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            "price: $price\$",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
