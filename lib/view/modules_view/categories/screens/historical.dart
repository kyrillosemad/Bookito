import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/shared_widgets/book_item.dart';
import 'package:bookito/view/shared_widgets/top_title.dart';
import 'package:bookito/view/shared_widgets/search_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookito/view%20model/book%20show/bloc/book_show_bloc.dart';
import 'package:sizer/sizer.dart';

class Historical extends StatefulWidget {
  const Historical({super.key});

  @override
  State<Historical> createState() => _HistoricalState();
}

class _HistoricalState extends State<Historical> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BookShowBloc>().add(FetchHistoricalBooks(search.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            children: [
              Container(
                  padding:
                      EdgeInsets.only(top: 10.sp, left: 10.sp, right: 10.sp),
                  width: 100.w,
                  height: 25.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TopTitle(title: "Historical Books"),
                      SizedBox(
                        height: 2.h,
                      ),
               Search(
                        onchanged: (value) {
                          context.read<BookShowBloc>().add(FetchHistoricalBooks(value.toString()));
                        },
                        search: search,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "You can find here all your Historical books",
                        style: TextStyle(
                            fontSize: 15.sp, color: MyColors().maincolor),
                      ),
                    ],
                  )),
              BlocBuilder<BookShowBloc, BookShowState>(
                builder: (context, state) {
                  if (state is Loading) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: MyColors().maincolor),
                      ),
                    );
                  } else if (state is ShowHistoricalBooks) {
                    return BookItem(state: state.historicalBooks);
                  } else if (state is Empty) {
                    return SizedBox(
                      width: 100.w,
                      height: 68.h,
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
                          "Error: ${state.msg}",
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
              ),
            ],
          ),
        ),
      )),
    );
  }
}
