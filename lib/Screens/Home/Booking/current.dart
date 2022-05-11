import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Const/colors.dart';
import 'package:maak_prject/Screens/Home/Booking/booking_status.dart';
import 'package:sizer/sizer.dart';

import '../../Const/images.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.h),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(1.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => BookingStatus()));
                      },
                      child: Container(
                        height: 15.h,
                        decoration: BoxDecoration(
                            color: kPrimaryWhite,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 1.5.h),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.grey[100],
                                      radius: 5.h,
                                      backgroundImage: AssetImage(image1))),
                              Container(
                                margin: EdgeInsets.only(top: 3.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Matt's Automotive...",
                                        style: TextStyle(
                                            color: kPrimaryBlack,
                                            fontFamily: 'SFPro',
                                            fontSize: 14.sp)),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 0.5.h),
                                      child: Row(
                                        children: [
                                          Image.asset(star1),
                                          SizedBox(width: 1.h),
                                          Text('4.5 - 254 Reviews',
                                              style: TextStyle(
                                                  color: kPrimaryGrey,
                                                  fontFamily: 'SFPro',
                                                  fontSize: 12.sp))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Image.asset(next2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
