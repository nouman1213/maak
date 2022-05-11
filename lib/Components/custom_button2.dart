import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Screens/Const/colors.dart';

class CustomButton2 extends StatelessWidget {
  Function() onTap;
  final String? title;
  Color? color;
  Color? txtColor;
  TextStyle? txtStyle;

  CustomButton2(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.color,
      this.txtColor,
      this.txtStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 6.h,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: kPrimaryOrange),
              borderRadius: BorderRadius.circular(30),
              color: color),
          child: Center(
            child: Text(
              title!,
              style: txtStyle,
            ),
          ),
        ),
      ),
    );
  }
}
