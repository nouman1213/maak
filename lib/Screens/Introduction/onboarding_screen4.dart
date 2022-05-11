import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:maak_prject/Screens/authentication/RegisterationScreens/signup_screen.dart';
import 'package:sizer/sizer.dart';

import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import '../authentication/LoginScreens/login_screen.dart';

class OnBoardingScreen4 extends StatelessWidget {
  OnBoardingScreen4({Key? key}) : super(key: key);
  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bg3),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 22.h),
                    child: Container(
                      height: 17.h,
                      width: 17.h,
                      child: Image.asset(
                        logo,
                      ),
                    )),
                SizedBox(height: 3.h),
                Text(
                  'Get automotive services at your doorstep \n no hassle no fuss',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFPro',
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                  child: Container(
                    height: 7.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryWhite),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 6.h),
                            child: Image.asset(fblogo)),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            signInWithFacebook();
                          },
                          child: Container(
                              child: Text(
                            'Continue with facebook',
                            style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 14.sp,
                              fontFamily: 'SFPro',
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
                //   child: Container(
                //     height: 7.h,
                //     decoration: BoxDecoration(
                //         border: Border.all(color: kPrimaryWhite),
                //         color: Colors.transparent,
                //         borderRadius: BorderRadius.circular(30)),
                //     child: Row(
                //       children: [
                //         Container(
                //             margin: EdgeInsets.only(left: 6.h),
                //             child: Image.asset(googleLogo)),
                //         SizedBox(width: 10.w),
                //         InkWell(
                //           onTap: () {},
                //           child: Container(
                //               child: Text(
                //             'Continue with Google',
                //             style: TextStyle(
                //                 color: kPrimaryWhite, fontSize: 14.sp),
                //           )),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: CustomButtonGradient(
                      title: 'Sign In',
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
                      txtStyle: TextStyle(
                        color: kPrimaryWhite,
                        fontSize: 16.sp,
                        fontFamily: 'SFPro',
                      )),
                ),
                SizedBox(height: 4.h),
                InkWell(
                    onTap: () {},
                    child: Text('Continue as Guest',
                        style: TextStyle(
                          color: kPrimaryGrey,
                          fontSize: 16.sp,
                          fontFamily: 'SFPro',
                        ))),
                SizedBox(height: 4.h),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SignUpScreen()));
                    },
                    child: Text('New here ? Sign Up',
                        style: TextStyle(
                            color: kPrimaryOrange,
                            fontFamily: 'SFPro',
                            fontSize: 16.sp))),
              ],
            ),
          )),
    );
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile', 'user_birthday']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
