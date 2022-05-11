import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

const kPrimaryOrange = Color(0xffF05A22);
const kprimegradient = Color(0xffF58A1F);
const kPrimaryWhite = Color(0xffffffff);
const kPrimaryBlack = Color(0xff070606);
const kPrimaryGrey = Color(0xff61656D);
const kprimarytransprnt = Color(0xfffafafa);
const kprimelightred = Color(0xffF16522);
PageController? pagecontroller = PageController();
showSnackBar(
  String title,
  String message,
) {
  Get.snackbar(title, message,
      backgroundColor: Colors.white,
      titleText: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 14.sp),
      ));
}
