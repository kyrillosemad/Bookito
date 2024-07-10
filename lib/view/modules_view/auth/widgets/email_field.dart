import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController email;
  const EmailField({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (value!.length < 13) {
          return "invalid gmail";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.email,
          color: MyColors().maincolor,
        ),
        label: Text(
          'Gmail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors().maincolor,
          ),
        ),
      ),
    );
  }
}
