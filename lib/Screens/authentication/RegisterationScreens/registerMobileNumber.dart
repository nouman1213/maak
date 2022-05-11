// ignore_for_file: must_be_immutable

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maak_prject/Screens/authentication/RegisterationScreens/verificationCode.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../../Components/custonButtonWite.dart';
import '../../Const/colors.dart';

class RegisterMobileNumber extends StatefulWidget {
  RegisterMobileNumber({Key? key}) : super(key: key);

  @override
  State<RegisterMobileNumber> createState() => _RegisterMobileNumberState();
}

class _RegisterMobileNumberState extends State<RegisterMobileNumber> {
  var sCountryCode;

  var formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController phoneController = TextEditingController();
  String verification_ID = "";
  // signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
  //   try {
  //     final authCred = await _auth.signInWithCredential(phoneAuthCredential);

  //     if (authCred.user != null) {
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => BottomNavigationBarScreen()));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print(e.message);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Some Error Occured. Try Again Later')));
  //   }
  // }

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
                        Text('What is your mobile\n number ?',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontFamily: 'SFPro',
                                fontSize: 16.sp)),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Container(
                              width: 18.w,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: kPrimaryWhite),
                                ),
                              ),
                              child: CountryCodePicker(
                                textStyle: TextStyle(color: kPrimaryWhite),

                                onChanged: (value) {
                                  sCountryCode = value.toString();
                                },
                                showFlag: false,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: '+965',
                                favorite: const ['+965', 'FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                            ),
                            Expanded(
                              child: customTextField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter mobile number';
                                    }
                                    if (value.length < 11) {
                                      return 'please enter valid mobile number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  textInputAction: TextInputAction.next,
                                  textEditingController: phoneController,
                                  hintText: 'mobile number',
                                  isPass: false,
                                  textInputType: TextInputType.phone),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            customButtonWhite(
                              onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => VerificationCode()));
                                }
                                // if (formkey.currentState!.validate()) {
                                //   appPro.setLoadingTrue();
                                //   var result = await _auth.verifyPhoneNumber(
                                //       phoneNumber:
                                //           "+92${phoneController.text.trim()}",
                                //       timeout: Duration(seconds: 80),
                                //       verificationCompleted:
                                //           (phoneAuthCredential) async {
                                //         appPro.setLoadingTrue();
                                //       },
                                //       verificationFailed: (verificationFailed) {
                                //         print(verificationFailed);
                                //         showSnackBar(
                                //             'Error', 'verification faild');
                                //       },
                                //       codeSent: (verificationID,
                                //           resendingToken) async {
                                //         appPro.setLoadingFalse();

                                //         showSnackBar(
                                //             'Alert', 'code sent successfully');
                                //         Navigator.push(
                                //             context,
                                //             MaterialPageRoute(
                                //                 builder: (_) =>
                                //                     VerificationCode()));

                                //         this.verification_ID = verificationID;
                                //       },
                                //       codeAutoRetrievalTimeout:
                                //           (verificationID) async {});

                                //   // showSnackBar("Success",
                                //   //     "OTP code sent to ${phoneController.text}");
                                //   appPro.setLoadingFalse();

                                //   // print('AAAA $result');
                                // } else {
                                //   appPro.setLoadingFalse();
                                //   print('errrror');
                                // }
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
