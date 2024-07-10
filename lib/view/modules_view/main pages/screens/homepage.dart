import 'package:bookito/view%20model/book%20show/bloc/book_show_bloc.dart';
import 'package:bookito/view/modules_view/main%20pages/widgets/home_page_center_part.dart';
import 'package:bookito/view/modules_view/main%20pages/widgets/home_page_lower_part.dart';
import 'package:bookito/view/modules_view/main%20pages/widgets/home_page_upper_part.dart';
import 'package:bookito/view/shared_widgets/drawer_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> home = GlobalKey<ScaffoldState>();

  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BookShowBloc>().add(FetchAllBooks(search.text));
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: home,
      drawer: const DrawerPart(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 5.sp),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              HomePageUpperPart(home: home),
              SizedBox(
                height: 2.h,
              ),
              const HomePageCenterPart(),
              SizedBox(
                height: 1.h,
              ),
              HomePageLowerPart(
                  home: home,
                  search: search,
                  event: FetchAllBooks(search.text)),
            ],
          )),
        ),
      ),
    );
  }
}
