// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maak_prject/Screens/authentication/RegisterationScreens/registerMobileNumber.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../../Components/custonButtonWite.dart';
import '../../Const/colors.dart';
import '../LoginScreens/login_screen.dart';

class ReEnterPassword extends StatelessWidget {
  ReEnterPassword({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Form(
              key: formkey,
              child: Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6.h),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 3.h,
                              width: 3.h,
                              child: Icon(
                                Icons.arrow_back,
                                color: kPrimaryWhite,
                              ),
                            )),
                        SizedBox(height: 6.h),
                        Text('Hi there, Introduce yourself !',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontFamily: 'SFPro',
                                fontSize: 16.sp)),
                        SizedBox(height: 6.h),
                        customTextField(
                          onChanged: (value) {
                            if (value!.isEmpty) {
                              appPro.visibleFalse();
                            } else {
                              appPro.visibleTrue();
                            }
                          },
                          textInputAction: TextInputAction.next,
                          textEditingController: appPro.passwordC,
                          hintText: 'Password',
                          isPass: false,
                          isShow: appPro.isShow,
                          onTapIcon: () {
                            appPro.isShowPass();
                          },
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter password';
                            }
                            if (value.length < 6) {
                              return 'Must be more than 6 charater';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 2.h),
                        customTextField(
                          textInputAction: TextInputAction.next,
                          textEditingController: appPro.re_PasswordC,
                          hintText: 'Re-enter-Password',
                          isPass: true,
                          isShow: appPro.isShow,
                          onTapIcon: () {
                            appPro.isShowPass();
                          },
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please Re-enter password';
                            }
                            if (value.length < 6) {
                              return 'Must be more than 6 charater';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginScreen()));
                                },
                                child: Text('Already have an account ?',
                                    style: TextStyle(
                                        color: kPrimaryWhite,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp))),
                            Spacer(),
                            customButtonWhite(
                              onTap: () async {
                                print(appPro.passwordC.text);
                                print(appPro.re_PasswordC.text);
                                if (formkey.currentState!.validate()) {
                                  if (appPro.passwordC.text.trim() !=
                                      appPro.re_PasswordC.text.trim()) {
                                    showSnackBar(
                                      "Error",
                                      "password not matched",
                                    );
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RegisterMobileNumber()));
                                  }
                                } else {
                                  // showSnackBar(
                                  //   "Error",
                                  //   "Something went wrong. Try again later",
                                  // );
                                  // appPro.setLoadingFalse();
                                }
                              },
                              title: 'Next',
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            appPro.isLoading
                ? Center(child: SpinKitCircle(color: kPrimaryWhite))
                : SizedBox(),
          ],
        );
      }),
    ));
  }
}
