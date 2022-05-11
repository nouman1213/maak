import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Home/Booking/current.dart';
import 'package:maak_prject/Screens/Home/Booking/history.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../Const/colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int index = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(body: SingleChildScrollView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Container(
                      margin: EdgeInsets.only(top: 7.h),
                      child: Text('Booking',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFPro',
                              fontSize: 16.sp))),
                ),
                SizedBox(height: 2.h),
                TabBar(
                    labelStyle: TextStyle(fontSize: 14.sp),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    padding: EdgeInsets.all(0),
                    indicatorColor: kPrimaryWhite,
                    tabs: [
                      Tab(
                        text: 'Current',
                      ),
                      Tab(
                        text: 'History',
                      ),
                    ]),
                Expanded(
                    child: TabBarView(
                        children: [CurrentScreen(), HistoryScreen()]))
              ],
            ),
          );
        }),
      )),
    );
  }
}
