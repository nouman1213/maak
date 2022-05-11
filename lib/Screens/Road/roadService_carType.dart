import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Road/roadService_tabBar_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../../Components/carTypeWidget.dart';
import '../../Components/custom_button_gradient.dart';
import '../../Components/selectDateWidget.dart';
import '../Const/colors.dart';

class RoadServiceCarTypeScreen extends StatefulWidget {
  const RoadServiceCarTypeScreen({Key? key}) : super(key: key);

  @override
  State<RoadServiceCarTypeScreen> createState() =>
      _RoadServiceCarTypeScreenState();
}

class _RoadServiceCarTypeScreenState extends State<RoadServiceCarTypeScreen> {
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
              SizedBox(height: 3.h),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 4.h,
                        width: 4.h,
                        child: Icon(Icons.arrow_back, color: kPrimaryWhite))),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3.h, right: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Car Type',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontFamily: 'SFPro',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
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
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Column(
                            children: [
                              CarTypeWidget(),
                              SizedBox(height: 4.h),
                              selectAreaWidget(),
                              SizedBox(height: 4.h),
                              CustomButtonGradient(
                                  title: 'Continue',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RoadTabBarScreen()));
                                  },
                                  txtStyle: TextStyle(
                                      color: kPrimaryWhite, fontSize: 14.sp))
                            ],
                          )),
                    ),
                  ),
                ),
              )
            ],
          ));
    }));
  }
}
