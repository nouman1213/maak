import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_button.dart';
import '../../Const/colors.dart';

class ConfirmationMail extends StatelessWidget {
  const ConfirmationMail({Key? key}) : super(key: key);

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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('A Referal link was send to \n your email',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp)),
                  SizedBox(height: 2.h),
                  Text('Please check your inbox Files',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp)),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    child: CustomButton(
                      title: 'Back to Sign In',
                      onTap: () {
                        Navigator.pop(context);
                      },
                      color: kPrimaryWhite,
                      txtStyle: TextStyle(
                          color: kPrimaryOrange,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp),
                    ),
                  )
                ],
              ),
            ));
      }),
    ));
  }
}
