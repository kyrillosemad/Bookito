import 'package:bookito/view/constants/colors.dart';
import 'package:flutter/material.dart';

class AddressField extends StatelessWidget {
  final TextEditingController address;
  const AddressField({super.key,required this.address});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.length < 5) {
          return "invalid address";
        } else {
          return null;
        }
      },
      controller: address,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.location_on_sharp,
          color: MyColors().maincolor,
        ),
        label: Text(
          'Address in details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: MyColors().maincolor,
          ),
        ),
      ),
    );
  }
}
