import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {
  final TextEditingController name;
  const FullNameField({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.length < 3) {
          return "invalid name";
        } else {
          return null;
        }
      },
      controller: name,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.check,
          color: MyColors().maincolor,
        ),
        label: Text(
          'Full name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors().maincolor,
          ),
        ),
      ),
    );
  }
}
