import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Introduction/select_country.dart';
import 'package:sizer/sizer.dart';

import '../../Components/custom_button.dart';
import '../Const/colors.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool isLanEnSelect = false;
  bool isLanArSelect = false;
  bool showHide = false;
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
                    'Select a language',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLanArSelect = false;
                      isLanEnSelect = true;
                    });
                  },
                  child: Container(
                    width: 22.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isLanEnSelect
                                ? Colors.white
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                        color:
                            isLanEnSelect ? Colors.white : Colors.transparent),
                    child: Center(
                      child: Text(
                        'English',
                        style: TextStyle(
                          color: isLanEnSelect ? kPrimaryOrange : kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                InkWell(
                  onTap: () {
                    setState(() {
                      isLanArSelect = true;
                      isLanEnSelect = false;
                    });
                  },
                  child: Container(
                    width: 22.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isLanArSelect
                                ? kPrimaryOrange
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(50),
                        color:
                            isLanArSelect ? Colors.white : Colors.transparent),
                    child: Center(
                      child: Text(
                        'عربي',
                        style: TextStyle(
                          color: isLanArSelect ? kPrimaryOrange : kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  child: CustomButton(
                    title: 'Continue',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SelectCountry()));
                    },
                    color: isLanEnSelect
                        ? Colors.white
                        : isLanArSelect
                            ? Colors.white
                            : Colors.grey[400],
                    txtStyle: TextStyle(
                      color: Colors.deepOrange,
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
