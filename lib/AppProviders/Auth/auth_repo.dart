import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

import '../../AppServices/services.dart';
import '../../Screens/Const/colors.dart';
import '../../Screens/Home/bottomNavigationBar.dart';
import '../../Screens/authentication/RegisterationScreens/verificationCode.dart';

class AuthentiRepo extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController otpC = TextEditingController();
  TextEditingController pincodeC = TextEditingController();
  String verificationID = "";
  Services services = Services();

  ///userRegister method
  Future userRegister(
    String fullName,
    String email,
    String password,
    String countryCode,
    String mobileNumber,
    String userType,
    String slectedLanguge,
  ) async {
    //debugPrint(phone);
    try {
      var bodyData = FormData.fromMap({
        "full_name": fullName,
        "email": email,
        "password": password,
        'country_code': countryCode,
        "mobile_number": mobileNumber,
        "user_type": userType,
        "seleted_language": slectedLanguge,
      });

      var response =
          await services.postResponse(url: "register", formData: bodyData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return false;
    }
  }

  ///checkEmail method
  // Future checkEmail(String email) async {
  //   try {
  //     var formData = FormData.fromMap({
  //       "email": email,
  //     });

  //     var response = await services.postResponse(
  //         url: "checkEmailExist", formData: formData);
  //     if (response != null) {
  //       return response;
  //     }
  //     return null;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
  Future checkEmail(String email) async {
    try {
      var formData = FormData.fromMap({
        "email": email,
      });

      var response = await services.postResponse(
          url: "checkEmailExist", formData: formData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  ///sendOTP method
  Future sendOTP(String mobileNumber) async {
    try {
      var formData = FormData.fromMap({"mobile_number": mobileNumber});

      var response = await services.postResponse(
          url: "testsendSmsonMobile", formData: formData);
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// phone authentication

  // Future phoneSignIn({required String phoneNumber}) async {
  //   await _auth.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       verificationCompleted: _onVerificationCompleted,
  //       verificationFailed: _onVerificationFailed,
  //       codeSent: _onCodeSent,
  //       codeAutoRetrievalTimeout: _onCodeTimeout);
  // }

  // _onVerificationCompleted(PhoneAuthCredential authCredential) async {
  //   print("verification completed ${authCredential.smsCode}");
  //   User? user = FirebaseAuth.instance.currentUser;

  //   if (authCredential.smsCode != null) {
  //     try {
  //       UserCredential credential =
  //           await user!.linkWithCredential(authCredential);
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'provider-already-linked') {
  //         await _auth.signInWithCredential(authCredential);
  //       }
  //     }
  //   }
  // }

  // _onVerificationFailed(FirebaseAuthException exception) {
  //   if (exception.code == 'invalid-phone-number') {
  //     showSnackBar("Error", "The phone number entered is invalid!");
  //   }
  // }

  // _onCodeSent(String verificationId, int? forceResendingToken) {
  //   this.verificationId = verificationId;
  //   print(forceResendingToken);
  //   print("code sent");
  // }

  // _onCodeTimeout(String timeout) {
  //   return null;
  // }

  Future verifyPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          print(phoneC.text);
        },
        verificationFailed: (FirebaseAuthException exception) {},
        codeSent: (String _verificationId, int? forceRespondToken) {
          verificationID = _verificationId;

          Get.to(() => VerificationCode());
        },
        codeAutoRetrievalTimeout: (String _verificationId) {
          verificationID = _verificationId;
        },
      );
    } catch (e) {
      print("Error Occured : $e");
    }
  }

  Future signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otpC.text,
      );

      var signInUser = await _auth.signInWithCredential(credential);

      // final User? user = signInUser.user;
      // showSnackBar('Alert', "Sign In Sucessfully, User UID : ${user!.uid}");

      Get.to(() => BottomNavigationBarScreen());

      print("Sign In Sucessfully ");
    } catch (e) {
      showSnackBar('Alert', "Error Occured : $e");
    }
  }

  ///

  signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {}
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ;
    }
  }
}
