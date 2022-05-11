import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButtonGradient extends StatelessWidget {
  Function() onTap;
  final String? title;
  Color? color;
  Color? txtColor;
  TextStyle? txtStyle;
  Color? gradient;

  CustomButtonGradient(
      {Key? key,
      required this.title,
      required this.onTap,
      this.color,
      this.txtColor,
      this.txtStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 6.h,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffF58A1F),
                  Color(0xffF05A22),
                ],
              ),
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
