// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../Const/colors.dart';

class BookingStatus extends StatefulWidget {
  BookingStatus({Key? key}) : super(key: key);

  @override
  State<BookingStatus> createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
  int activeStep = 0; // Initial step set to 5.

  int lastIndex = 6; // upperBound MUST BE total number of icons minus 1.

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 2.h),
                      child: Container(
                          height: 4.h,
                          width: 4.h,
                          child: Icon(
                            Icons.arrow_back,
                            color: kPrimaryWhite,
                          )),
                    )),
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.only(left: 1.h, bottom: 3.h),
                  child: Text('Booking Status',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SFPro',
                          fontSize: 16.sp)),
                ),
                Expanded(
                  child: Container(
                    height: 100.h,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3.h),
                            Container(
                              // width: 500,
                              height: 90,
                              // color: Colors.blue,
                              child: Stepper(
                                
                                  steps: [
                                    Step(
                                      isActive: true,
                                      title: Text(""),
                                      content: Text(""),
                                    ),
                                    Step(
                                      isActive: true,
                                      title: Text(""),
                                      content: Text(""),
                                    ),
                                    Step(
                                      isActive: true,
                                      title: Text(""),
                                      content: Text(""),
                                    ),
                                    Step(
                                        isActive: true,
                                        state: StepState.disabled,
                                        title: Text(""),
                                        content: Text(""))
                                  ],
                                  // margin: EdgeInsets.all(10),
                                  type: StepperType.horizontal,
                                  currentStep: activeStep,
                                  onStepTapped: (int step) {
                                    setState(() {
                                      activeStep = step;
                                    });
                                  }),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, bottom: 3.h),
                              child: Text('Booking Info',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                            ),
                            Card(
                              elevation: 3,
                              child: Container(
                                height: 28.h,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(10),
                                //   color: kPrimaryWhite,
                                // ),
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Order No: 1144HB',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryBlack,
                                              fontFamily: 'SFPro',
                                            ),
                                          ),
                                          Text(
                                            '12 May 2019',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Services 1',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                            ),
                                          ),
                                          Text(
                                            '30 KWD',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Services 1',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          ),
                                          Text(
                                            '50 KWD',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Services 1',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          ),
                                          Text(
                                            '70 KWD',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryBlack,
                                              fontFamily: 'SFPro',
                                            ),
                                          ),
                                          Text(
                                            '150 KWD',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryBlack,
                                              fontFamily: 'SFPro',
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: EdgeInsets.only(left: 1.h, bottom: 0.h),
                              child: Text('Select Car',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                            ),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(1.h),
                                    height: 7.h,
                                    width: 30.w,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text('Nissan',
                                            style: TextStyle(
                                                color: kPrimaryBlack,
                                                fontSize: 12.sp,
                                                fontFamily: 'SFPro',
                                                fontWeight: FontWeight.bold)),
                                        Text('GTR Skyline',
                                            style: TextStyle(
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                              fontSize: 10.sp,
                                            ))
                                      ],
                                    )),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  child: Container(
                                    padding: EdgeInsets.all(1.h),
                                    height: 7.h,
                                    width: 30.w,
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text('Porshe',
                                            style: TextStyle(
                                                color: kPrimaryBlack,
                                                fontSize: 12.sp,
                                                fontFamily: 'SFPro',
                                                fontWeight: FontWeight.bold)),
                                        Text('GT3 RS',
                                            style: TextStyle(
                                              color: kPrimaryGrey,
                                              fontSize: 10.sp,
                                              fontFamily: 'SFPro',
                                            ))
                                      ],
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('Address',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                            ),
                            Text(
                                '678 Kienow Meadow, 448 Kslerin Ridge Apt. 656',
                                style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontFamily: 'SFPro',
                                    fontSize: 12.sp)),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('Address',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                            ),
                            Text(
                                '678 Kienow Meadow, 448 Kslerin Ridge Apt. 656',
                                style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontFamily: 'SFPro',
                                    fontSize: 12.sp)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    }));
  }

  /// Returns the next button.
  // Widget nextButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       // Increment activeStep, when the next button is tapped. However, check for upper bound.
  //       if (activeStep < lastIndex) {
  //         setState(() {
  //           activeStep++;
  //         });
  //       }
  //     },
  //     child: Text('Next'),
  //   );
  // }

  /// Returns the previous button.
  // Widget previousButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
  //       if (activeStep > 0) {
  //         setState(() {
  //           activeStep--;
  //         });
  //       }
  //     },
  //     child: Text('Prev'),
  //   );
  // }

  /// Returns the header wrapping the header text.

}
