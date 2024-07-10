// ignore_for_file: non_constant_identifier_names, file_names
import 'dart:io';
import 'package:bookito/main.dart';
import 'package:bookito/view%20model/my%20book/bloc/book_manage_bloc.dart';
import 'package:bookito/view/constants/colors.dart';
import 'package:bookito/view/constants/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  String borrowing = "borrowing";
  String buying = "buying";
  String type = "buying";

  String category = "general";
  String general = "general";
  String sports = "sports";
  String educational = "educational";
  String fantasy = "fantasy";
  String crime = "crime";
  String science = "science";
  String historical = "historical";
  String romantic = "romantic";
  String novel = "novel";

  GlobalKey<FormState> add_form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController owner_phone = TextEditingController();

  XFile? image;

  Future getimagefromgallery() async {
    final picked_image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      image = XFile(picked_image!.path);
    });
    Get.back();
  }

  Future getimagefromcamera() async {
    final picked_image =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      image = XFile(picked_image!.path);
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<BookManageBloc, BookManageState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
                child: SizedBox(
              width: 100.w,
              child: Column(
                children: [
                  /////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                      padding: EdgeInsets.only(
                          top: 15.sp, right: 15.sp, left: 15.sp),
                      width: 100.w,
                      height: 22.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add new book",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: MyColors().maincolor),
                                ),
                                Icon(
                                  Icons.bookmark_added_sharp,
                                  size: 30.sp,
                                  color: MyColors().maincolor,
                                )
                              ]),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "You can display your book here and someone else can benefit from it, whether by borrowing or buying it",
                            style: TextStyle(
                                fontSize: 11.sp, color: MyColors().maincolor),
                          ),
                        ],
                      )),
                  /////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  ////////////////////////////////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////////////////////////////
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    width: 100.w,
                    child: Form(
                      key: add_form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Pick an image!",
                                      titleStyle: TextStyle(
                                          color: MyColors().maincolor),
                                      cancelTextColor: MyColors().maincolor,
                                      textCancel: "Camera",
                                      textConfirm: "Gallery",
                                      buttonColor: MyColors().maincolor,
                                      content: Text(
                                        "From where",
                                        style: TextStyle(
                                            color: MyColors().maincolor),
                                      ),
                                      confirmTextColor: Colors.white,
                                      onCancel: () {
                                        getimagefromcamera();
                                      },
                                      onConfirm: () {
                                        getimagefromgallery();
                                      },
                                    );
                                  },
                                  child: image == null
                                      ? CircleAvatar(
                                          backgroundColor: MyColors().maincolor,
                                          radius: 40,
                                          child: Icon(
                                            Icons.image,
                                            size: 25.sp,
                                            color: Colors.white,
                                          ))
                                      : SizedBox(
                                          width: 35.w,
                                          height: 15.h,
                                          child: Image.file(File(image!.path)),
                                          // child: Image.file("1000228373.jpg"),
                                        ))
                              .animate()
                              .scale(),

                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              } else {
                                return null;
                              }
                            },
                            controller: name,
                            cursorColor: MyColors().maincolor,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors().maincolor),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors().maincolor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors().maincolor)),
                                prefixIcon: Icon(
                                  Icons.book,
                                  color: MyColors().maincolor,
                                ),
                                labelStyle:
                                    TextStyle(color: MyColors().maincolor),
                                labelText: "Name"),
                          ).animate().fade().slideX(
                              duration: const Duration(milliseconds: 500)),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              } else {
                                return null;
                              }
                            },
                            controller: description,
                            maxLines: 5,
                            cursorColor: MyColors().maincolor,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors().maincolor),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors().maincolor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors().maincolor)),
                                prefixIcon: Icon(
                                  Icons.book,
                                  color: MyColors().maincolor,
                                ),
                                labelStyle:
                                    TextStyle(color: MyColors().maincolor),
                                labelText: "Description"),
                          ).animate().fade().slideX(
                              begin: 1,
                              duration: const Duration(milliseconds: 500)),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          Row(
                            children: [
                              SizedBox(
                                width: 65.w,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: author,
                                  cursorColor: MyColors().maincolor,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: MyColors().maincolor),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors().maincolor)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors().maincolor)),
                                      prefixIcon: Icon(
                                        Icons.person_3_outlined,
                                        color: MyColors().maincolor,
                                      ),
                                      labelStyle: TextStyle(
                                          color: MyColors().maincolor),
                                      labelText: "Author"),
                                ).animate().fade().slideX(
                                    duration:
                                        const Duration(milliseconds: 500)),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                width: 26.w,
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required field";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: price,
                                  keyboardType: TextInputType.number,
                                  cursorColor: MyColors().maincolor,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: MyColors().maincolor),
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors().maincolor)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors().maincolor)),
                                      prefixIcon: Icon(
                                        Icons.price_change,
                                        color: MyColors().maincolor,
                                      ),
                                      labelStyle: TextStyle(
                                          color: MyColors().maincolor),
                                      labelText: "\$"),
                                ).animate().fade().slideX(
                                    begin: 1,
                                    duration:
                                        const Duration(milliseconds: 500)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          Container(
                            width: 100.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors().maincolor,
                                ),
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: ListTile(
                              title: Text(
                                type,
                                style: TextStyle(color: MyColors().maincolor),
                              ),
                              trailing: PopupMenuButton(
                                color: MyColors().maincolor,
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      value: buying,
                                      child: Text(
                                        buying,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: borrowing,
                                      child: Text(borrowing,
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  setState(() {
                                    type = value;
                                  });
                                },
                              ),
                            ),
                          ).animate().fade().slideX(
                              duration: const Duration(milliseconds: 500)),

                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////

                          Container(
                            width: 100.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors().maincolor,
                                ),
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: ListTile(
                              title: Text(
                                category,
                                style: TextStyle(color: MyColors().maincolor),
                              ),
                              trailing: PopupMenuButton(
                                color: MyColors().maincolor,
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      value: general,
                                      child: Text(
                                        general,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: novel,
                                      child: Text(
                                        novel,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: romantic,
                                      child: Text(
                                        romantic,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: educational,
                                      child: Text(
                                        educational,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: sports,
                                      child: Text(
                                        sports,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: historical,
                                      child: Text(
                                        historical,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: science,
                                      child: Text(
                                        science,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: fantasy,
                                      child: Text(
                                        fantasy,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: crime,
                                      child: Text(crime,
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ),
                                  ];
                                },
                                onSelected: (value) {
                                  setState(() {
                                    category = value;
                                  });
                                },
                              ),
                            ),
                          ).animate().fade().slideX(
                              begin: 1,
                              duration: const Duration(milliseconds: 500)),

                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            initialValue: "${id!.getString("user_name")}",
                            readOnly: true,
                            cursorColor: MyColors().maincolor,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors().maincolor),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors().maincolor)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors().maincolor)),
                              prefixIcon: Icon(
                                Icons.book,
                                color: MyColors().maincolor,
                              ),
                              labelStyle:
                                  TextStyle(color: MyColors().maincolor),
                            ),
                          ).animate().fade().slideX(
                              duration: const Duration(milliseconds: 500)),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            initialValue: "${id!.getString("user_email")}",
                            readOnly: true,
                            cursorColor: MyColors().maincolor,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors().maincolor),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors().maincolor)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors().maincolor)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: MyColors().maincolor,
                              ),
                              labelStyle:
                                  TextStyle(color: MyColors().maincolor),
                            ),
                          ).animate().fade().slideX(
                              begin: 1,
                              duration: const Duration(milliseconds: 500)),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required field";
                              } else if (value.length < 11) {
                                return "invalid phone number";
                              } else {
                                return null;
                              }
                            },
                            controller: owner_phone,
                            keyboardType: TextInputType.phone,
                            cursorColor: MyColors().maincolor,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors().maincolor),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors().maincolor)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors().maincolor)),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: MyColors().maincolor,
                                ),
                                labelStyle:
                                    TextStyle(color: MyColors().maincolor),
                                labelText: "Your phone"),
                          ).animate().fade().slideX(
                              duration: const Duration(milliseconds: 500)),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          TextFormField(
                            initialValue: "${id!.getString("user_address")}",
                            readOnly: true,
                            cursorColor: MyColors().maincolor,
                            style: TextStyle(
                                fontSize: 12.sp, color: MyColors().maincolor),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors().maincolor)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: MyColors().maincolor)),
                              prefixIcon: Icon(
                                Icons.location_on_outlined,
                                color: MyColors().maincolor,
                              ),
                              labelStyle:
                                  TextStyle(color: MyColors().maincolor),
                            ),
                          ).animate().fade().slideX(
                              begin: 1,
                              duration: const Duration(milliseconds: 500)),
                          SizedBox(
                            height: 1.h,
                          ),
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                          InkWell(
                            onTap: () {
                              if (add_form.currentState!.validate() &&
                                  image != null) {
                                context.read<BookManageBloc>().add(InsertBook(
                                    image,
                                    name.text,
                                    description.text,
                                    price.text,
                                    owner_phone.text,
                                    id!.getString("user_name"),
                                    author.text,
                                    id!.getString("user_email"),
                                    userId,
                                    id!.getString("user_address"),
                                    type,
                                    category));
                              } else if (image == null) {
                                Get.defaultDialog(
                                  title: "failed !",
                                  titleStyle:
                                      TextStyle(color: MyColors().maincolor),
                                  cancelTextColor: MyColors().maincolor,
                                  buttonColor: MyColors().maincolor,
                                  content: Text(
                                    "Please pick an image for book",
                                    style:
                                        TextStyle(color: MyColors().maincolor),
                                  ),
                                  confirmTextColor: Colors.white,
                                  onConfirm: () {
                                    Get.back();
                                  },
                                );
                              }
                            },
                            child: Container(
                              width: 80.w,
                              height: 6.h,
                              decoration: BoxDecoration(
                                  color: MyColors().maincolor,
                                  borderRadius: BorderRadius.circular(15.sp)),
                              child: Center(
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                          /////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          ////////////////////////////////////////////////////////////////////////////////////////////////
                          //////////////////////////////////////////////////////////////////////////////////////////////
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
