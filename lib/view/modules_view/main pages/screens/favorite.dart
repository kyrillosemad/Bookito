import 'package:bookito/view%20model/favorite%20bloc/bloc/favorite_bloc.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/shared_widgets/book_item.dart';
import 'package:bookito/view/shared_widgets/top_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteBloc>().add(FetchAllFavorite());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(15.sp),
                width: 100.w,
                height: 20.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TopTitle(title: "Favorite Books"),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Text(
                      "You can find here all your favorite books",
                      style: TextStyle(
                          fontSize: 13.sp, color: MyColors().maincolor),
                    ),
                  ],
                )),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is ShowFavoriteBooks) {
                  return BookItem(state: state.favoriteBooks);
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
      )),
    );
  }
}
