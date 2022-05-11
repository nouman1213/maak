import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Const/colors.dart';
import 'onboardin_screen3.dart';
import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';
import 'onboarding_screen4.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({required this.controller});
  final PageController controller;
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: widget.controller,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: [
              OnBoardingScreen1(),
              OnBoardingScreen2(),
              OnBoardingScreen3(),
              OnBoardingScreen4(),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 94.h),
            // color: Colors.red,
            height: 5.h,
            child: Row(
              children: [
                SizedBox(
                  width: 40.w,
                ),
                for (int i = 0; i <= 3; i++)
                  i == currentIndex ? buildCircle(true) : buildCircle(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCircle(bool isActive) {
    return Padding(
      padding: EdgeInsets.all(0.5.h),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: isActive ? 5 : 4,
        width: isActive ? 25 : 6,
        decoration: BoxDecoration(
          color: isActive ? kPrimaryOrange : Colors.orange,
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
        ),
      ),
    );
  }
}

class OnBoardingScreenItems extends StatelessWidget {
  final String imagepath, title, subtitle;
  final Color color;

  OnBoardingScreenItems(
      {required this.imagepath,
      required this.subtitle,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 10,
          ),
          Container(
            height: size.height / 2,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagepath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
