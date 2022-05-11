// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/authentication/LoginScreens/forgetPassword.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../Const/colors.dart';
import '../../Const/images.dart';
import '../../Home/bottomNavigationBar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Container(
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
              child: Form(
                key: formKey,
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
                          child: Icon(
                            Icons.arrow_back,
                            color: kPrimaryWhite,
                          ),
                        )),
                    SizedBox(height: 6.h),
                    Text('Welcome Back !',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontFamily: 'SFPro',
                            fontSize: 16.sp)),
                    SizedBox(height: 6.h),
                    customTextField(
                      validator: (value) {
                        Pattern pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = new RegExp('$pattern');
                        if (!regex.hasMatch(value!) || value == null)
                          return 'Enter a valid email address';
                        else
                          return null;
                      },
                      hintText: 'Email',
                      textEditingController: appPro.emailC,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(height: 2.h),
                    customTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter password';
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        textEditingController: appPro.passwordC,
                        hintText: 'Password',
                        isPass: true,
                        isShow: appPro.isShow,
                        onTapIcon: () {
                          appPro.isShowPass();
                        },
                        textInputType: TextInputType.visiblePassword),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ForgetPassword()));
                            },
                            child: Text('Forget Password ?',
                                style: TextStyle(
                                    color: kPrimaryWhite, fontSize: 14.sp))),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              appPro.clearController();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          BottomNavigationBarScreen()));
                            }
                          },
                          child: Container(
                            height: 5.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kPrimaryWhite),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(
                                    child: Text('Next',
                                        style: TextStyle(
                                            fontFamily: 'SFPro',
                                            fontSize: 12.sp,
                                            color: kPrimaryOrange))),
                                Container(
                                    height: 2.h,
                                    child: Image.asset(next_orange)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      }),
    ));
  }
}
