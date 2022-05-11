import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Components/custom_button.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import 'onboarding_screen_main.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String? sCountryCode;
  bool isLanEnSelect = false;
  bool isLanArSelect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Text(
                    'Select Country',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  child: Container(
                    // width: 85.w,
                    height: 7.h,
                    margin: EdgeInsets.only(left: 2.h, right: 2.h),
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30)),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CountryCodePicker(
                          textStyle:
                              TextStyle(color: kPrimaryOrange, fontSize: 11.sp),
                          onChanged: (value) {
                            sCountryCode = value.toString();
                          },
                          showFlag: false,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'الكويت',
                          favorite: const ['+965', 'الكويت'],
                          // optional. Shows only country name and flag
                          showCountryOnly: true,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: true,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                        ),
                        Container(
                          height: 4.h,
                          width: 4.w,
                          margin: EdgeInsets.only(right: 3.h),
                          child: Image.asset(downArro),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: CustomButton(
                    title: 'Next',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => OnBoardingScreen(
                                    controller: pagecontroller!,
                                  )));
                    },
                    color: Colors.white,
                    txtStyle: TextStyle(
                      color: kPrimaryOrange,
                      fontFamily: 'SFPro',
                      fontSize: 14.sp,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
