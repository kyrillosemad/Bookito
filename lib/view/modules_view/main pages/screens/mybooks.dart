import 'package:bookito/view%20model/my%20book/bloc/book_manage_bloc.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/modules_view/main%20pages/widgets/book_item_in_mybooks.dart';
import 'package:bookito/view/shared_widgets/top_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

@override
class _MyBooksState extends State<MyBooks> {
  @override
  void initState() {
    super.initState();
    context.read<BookManageBloc>().add(FetchMyBooks());
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
                      const TopTitle(title: "My Books"),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "You can find here all your books you add it ",
                        style: TextStyle(
                            fontSize: 14.sp, color: MyColors().maincolor),
                      ),
                    ],
                  )),
              BlocBuilder<BookManageBloc, BookManageState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is Empty) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "there's unknown state",
                          style: TextStyle(
                              fontSize: 20.sp, color: MyColors().maincolor),
                        ),
                      ),
                    );
                  } else if (state is ShowMybooks) {
                    return MyBooksBookItem(state: state.myBooks);
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
        )));
  }
}
