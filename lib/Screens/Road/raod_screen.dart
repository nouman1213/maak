import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Road/roadService_carType.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';

class RoadScreen extends StatefulWidget {
  const RoadScreen({Key? key}) : super(key: key);

  @override
  State<RoadScreen> createState() => _RoadScreenState();
}

class _RoadScreenState extends State<RoadScreen> {
  List roadServices = [
    'Towing',
    'Tire Repair',
    'Car Door lock open or fix',
    'Tire change',
    'Battery Replace',
  ];
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
                      Text('Road Service',
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
                        child: ListView.builder(
                          itemCount: roadServices.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              RoadServiceCarTypeScreen()));
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(roadServices[index],
                                        style: TextStyle(
                                          color: kPrimaryGrey,
                                          fontFamily: 'SFPro',
                                          fontSize: 12.sp,
                                        )),
                                    Divider(
                                      color: kPrimaryGrey,
                                      height: 4.h,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
