// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maak_prject/Screens/Home/bottomNavigationBar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/Auth/auth_repo.dart';
import '../../../AppProviders/appProvider.dart';
import '../../../Components/custonButtonWite.dart';
import '../../Const/colors.dart';

class VerificationCode extends StatelessWidget {
  VerificationCode({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var sCountryCode;
  TextEditingController pincodeC = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verification_ID = "";

  @override
  Widget build(BuildContext context) {
    // var aapPro = Provider.of<AppProvider>(context, listen: false);

    // signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    //   try {
    //     final authCred = await _auth.signInWithCredential(phoneAuthCredential);

    //     if (authCred.user != null) {
    //       aapPro.setLoadingTrue();
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => BottomNavigationBarScreen()));
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     aapPro.setLoadingFalse();
    //     print(e.message);
    //     showSnackBar('Error', 'Something went wrong!');
    //   }
    // }

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
                              height: 3.h,
                              width: 3.h,
                              child: Icon(
                                Icons.arrow_back,
                                color: kPrimaryWhite,
                              ),
                            )),
                        SizedBox(height: 6.h),
                        Text('SMS verification code',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontFamily: 'SFPro',
                                fontSize: 16.sp)),
                        SizedBox(height: 6.h),
                        PinCodeTextField(
                          validator: (Value) {
                            if (Value!.isEmpty) {
                              return "please enter otp code";
                            }
                            return null;
                          },
                          onCompleted: (String val) {},
                          appContext: context,
                          controller: pincodeC,
                          length: 6,
                          onChanged: (value) {},
                          pinTheme: PinTheme(

                              // fieldOuterPadding: EdgeInsets.all(2),
                              borderRadius: BorderRadius.circular(10),
                              shape: PinCodeFieldShape.box,
                              activeColor: Colors.green,
                              inactiveColor: kPrimaryWhite,
                              fieldHeight: 7.h,
                              fieldWidth: 7.h),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: (() {}),
                              child: Text('Resend ?',
                                  style: TextStyle(
                                      color: kPrimaryWhite,
                                      fontFamily: 'SFPro',
                                      fontSize: 12.sp)),
                            ),
                            Spacer(),
                            customButtonWhite(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  await _auth
                                      .signInWithCredential(
                                          PhoneAuthProvider.credential(
                                              verificationId: verification_ID,
                                              smsCode: pincodeC.text.trim()))
                                      .then((value) {
                                    if (value.user != null) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  BottomNavigationBarScreen()));
                                    } else {
                                      showSnackBar(
                                          "Error", 'Something went wrong!');
                                    }
                                  });
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             BottomNavigationBarScreen()));
                                  appPro.setLoadingFalse();
                                } else {
                                  showSnackBar("Oops", 'Something went wrong!');
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
                ? Center(child: SpinKitCircle(color: kPrimaryWhite))
                : SizedBox(),
          ],
        );
      }),
    ));
  }
}
