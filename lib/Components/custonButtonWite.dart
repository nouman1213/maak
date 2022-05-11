import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Screens/Const/colors.dart';
import '../Screens/Const/images.dart';

class customButtonWhite extends StatelessWidget {
  String title;
  Function() onTap;
  customButtonWhite({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 5.h,
        width: 30.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: kPrimaryWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(child: Text(title, style: TextStyle(color: kPrimaryOrange))),
            Container(height: 2.h, child: Image.asset(next_orange)),
          ],
        ),
      ),
    );
  }
}
