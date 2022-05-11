import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  Function() onTap;
  final String? title;
  Color? color;
  Color? txtColor;
  TextStyle? txtStyle;
  Color? gradient;

  CustomButton(
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
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 7.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: color),
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
