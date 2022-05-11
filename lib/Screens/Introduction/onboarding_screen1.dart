import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Components/custom_button2.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg0),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 25.h),
                  child: Container(
                    height: 17.h,
                    width: 17.h,
                    child: Image.asset(
                      logo,
                    ),
                  )),
              SizedBox(height: 30.h),
              Text(
                'Welcome to Maak',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFPro',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Get automotive services at your doorstep \n no hassle no fuss',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'SFPro',
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(height: 3.h),
              CustomButton2(
                title: 'Get started',
                onTap: () {
                  pagecontroller!.animateToPage(3,
                      duration: const Duration(microseconds: 400),
                      curve: Curves.easeIn);
                },
                color: kPrimaryWhite,
                txtStyle: const TextStyle(color: kPrimaryOrange),
              )
            ],
          ),
        ));
  }
}
