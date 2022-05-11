import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Const/colors.dart';
import 'package:maak_prject/Screens/Wash/wash_main_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/images.dart';

class WashScreen extends StatelessWidget {
  const WashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppProvider>(builder: (context, appPro, _) {
      return Container(
          height: 100.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background1.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 4.h, width: 4.h, child: Image.asset(back))),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3.h, right: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wash',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WashMAinScreen()));
                        },
                        child: Text('Change Details',
                            style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 14.sp,
                            )),
                      ),
                    ],
                  )),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: GlowingOverscrollIndicator(
                      color: kPrimaryOrange,
                      axisDirection: AxisDirection.down,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.h,
                        ),
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text('Air Pressure',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Divider(
                              height: 5.h,
                              color: kPrimaryGrey,
                            ),
                            SizedBox(height: 2.h),
                            InkWell(
                              onTap: () {},
                              child: Text('Tire Cleaning',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Divider(
                              height: 5.h,
                              color: kPrimaryGrey,
                            ),
                            SizedBox(height: 2.h),
                            InkWell(
                              onTap: () {},
                              child: Text('Tire Buffing',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Divider(
                              height: 5.h,
                              color: kPrimaryGrey,
                            ),
                            SizedBox(height: 2.h),
                            InkWell(
                              onTap: () {},
                              child: Text('Rims Cleaning',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Divider(
                              height: 5.h,
                              color: kPrimaryGrey,
                            ),
                            SizedBox(height: 2.h),
                            InkWell(
                              onTap: () {},
                              child: Text('Tire Balanching',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Divider(
                              height: 5.h,
                              color: kPrimaryGrey,
                            ),
                            SizedBox(height: 2.h),
                            InkWell(
                              onTap: () {},
                              child: Text('Others',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Divider(
                              height: 5.h,
                              color: kPrimaryGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ));
    }));
  }
}
