// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maak_prject/AppProviders/Auth/auth_repo.dart';
import 'package:maak_prject/Screens/authentication/RegisterationScreens/reEnterPassword.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../../Components/custonButtonWite.dart';
import '../../Const/colors.dart';
import '../LoginScreens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var aapPro = Provider.of<AuthentiRepo>(context, listen: false);
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
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
                    key: formkey,
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
                          hintText: 'Name',
                          textEditingController: appPro.nameC,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter name';
                            }
                            if (value.length < 3) {
                              return 'Must be more than 3 charater';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 2.h),
                        customTextField(
                          textInputAction: TextInputAction.next,
                          textEditingController: appPro.emailC,
                          hintText: 'Email',
                          isPass: false,
                          textInputType: TextInputType.name,
                          validator: (value) {
                            Pattern pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regex = new RegExp('$pattern');
                            if (!regex.hasMatch(value!))
                              return 'Enter a valid email address';
                            else
                              return null;
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
                                        fontSize: 12.sp))),
                            Spacer(),
                            customButtonWhite(
                              onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  print(appPro.emailC.text);
                                  print(appPro.passwordC.text);
                                  // appPro.setLoadingTrue();
                                  appPro.clearController();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => ReEnterPassword()));

                                  // var result = await AuthentiRepo()
                                  //     .checkEmail(appPro.emailC.text.trim());
                                  // print('nnnnnnnn $result');
                                  // if (result != null) {
                                  //   if (result['status'] == 1) {
                                  //     appPro.setLoadingFalse();
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (_) =>
                                  //                 ReEnterPassword()));
                                  //   } else {
                                  //     showSnackBar(
                                  //       'Alert',
                                  //       result["message"],
                                  //     );
                                  //     appPro.setLoadingFalse();
                                  //   }
                                  // } else {
                                  //   showSnackBar(
                                  //     "Error",
                                  //     "Something went wrong. Try again later",
                                  //   );
                                  //   appPro.setLoadingFalse();
                                  // }
                                }
                              },
                              title: 'Next',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            appPro.isLoading
                ? Center(
                    child: SpinKitRing(
                      color: kPrimaryWhite,
                    ),
                  )
                : const SizedBox()
          ],
        );
      }),
    ));
  }
}
