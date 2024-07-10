import 'package:bookito/view%20model/book%20show/bloc/book_show_bloc.dart';
import 'package:bookito/view%20model/favorite%20bloc/bloc/favorite_bloc.dart';
import 'package:bookito/view%20model/my%20book/bloc/book_manage_bloc.dart';
import 'package:bookito/view/modules_view/intro/screens/intro.dart';
import 'package:bookito/view/shared_widgets/bottom%20nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

SharedPreferences? id;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  id = await SharedPreferences.getInstance();
  return runApp(const BookIto());
}

class BookIto extends StatelessWidget {
  const BookIto({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BookShowBloc(),
            ),
            BlocProvider(
              create: (context) => FavoriteBloc(),
            ),
            BlocProvider(
              create: (context) => BookManageBloc(),
            ),
          ],
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: id!.getString("userid") == null
                ? const Introduction()
                : const BottomNav(),
          ),
        );
      },
    );
  }
}
