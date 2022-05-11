import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../Const/colors.dart';
import '../../Const/images.dart';
import '../RegisterationScreens/confirmationEmail.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

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
                          height: 3.h, width: 3.h, child: Image.asset(back))),
                  SizedBox(height: 6.h),
                  Text('Welcome Back !',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 16.sp)),
                  SizedBox(height: 6.h),
                  customTextField(  validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter name';
                            } else {
                              return null;
                            }
                            
                          },
                    onChanged: (value) {
                      if (value!.isEmpty) {
                        appPro.visibleFalse();
                      } else {
                        appPro.visibleTrue();
                      }
                    },
                    hintText: 'Email / Phone',
                    error: '',
                    textEditingController: appPro.nameC,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: appPro.isVisible,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ConfirmationMail()));
                          },
                          child: Container(
                            height: 5.h,
                            width: 32.w,
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
                      ),
                    ],
                  ),
                ],
              ),
            ));
      }),
    ));
  }
}
