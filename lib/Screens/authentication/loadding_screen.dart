import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';

class LoaddingScreen extends StatefulWidget {
  const LoaddingScreen({Key? key}) : super(key: key);

  @override
  State<LoaddingScreen> createState() => _LoaddingScreenState();
}

class _LoaddingScreenState extends State<LoaddingScreen> {
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
                  Text('Verification Successful !',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp)),
                  SizedBox(height: 2.h),
                  Text('Welcome to Maak ',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 24.sp,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 2.h),
                  Text('John Doe',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp)),
                  SizedBox(height: 2.h),
                  CircularProgressIndicator(
                    backgroundColor: kPrimaryWhite,
                    color: Colors.grey,
                  ),
                ],
              ),
            ));
      }),
    ));
  }
}
