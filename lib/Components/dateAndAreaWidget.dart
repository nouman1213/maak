import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../AppProviders/appProvider.dart';
import '../Screens/Const/colors.dart';
import '../Screens/Const/images.dart';

class DateAndTimeWidget extends StatefulWidget {
  const DateAndTimeWidget({Key? key}) : super(key: key);

  @override
  State<DateAndTimeWidget> createState() => _DateAndTimeWidgetState();
}

class _DateAndTimeWidgetState extends State<DateAndTimeWidget> {
  DateTime now = DateTime.now();

  int? selectedIndex;
  int? selectedTime;
  List<String> time = [''];
  int? isSelectedDate;
  List<String> weekList = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];
  List<String> daysList = [
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '01',
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Select Date',
                  style: TextStyle(
                      color: kPrimaryBlack,
                      fontSize: 14.sp,
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    calendar,
                    height: 3.h,
                    width: 3.h,
                  )),
            ],
          ),
          SizedBox(height: 2.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 3.h, left: 35.w),
                child: Text(
                  DateFormat.yMMMM().format(now),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: 'SFPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
                ),
              ),
              Container(
                height: 12.h,
                //                 color: Colors.red,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: weekList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.h, vertical: 1.5.h),
                      child: Column(
                        children: [
                          Text(
                            weekList[index],
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: "SFpro",
                                color: kPrimaryOrange),
                          ),
                          SizedBox(height: 2.h),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isSelectedDate = index;
                              });
                            },
                            child: Container(
                              height: 4.h,
                              width: 4.h,
                              decoration: BoxDecoration(
                                  color: isSelectedDate == index
                                      ? kPrimaryOrange
                                      : Colors.transparent,
                                  border: Border.all(color: kPrimaryOrange),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                  child: Text(
                                daysList[index],
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: "SFpro",
                                    color: isSelectedDate == index
                                        ? kPrimaryWhite
                                        : kPrimaryOrange),
                              )),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // CalendarWeek(
              //   controller: CalendarWeekController(),
              //   height: 100,
              //   showMonth: true,
              //   // minDate:
              //   //     DateTime.now().add(Duration(days: -365)),
              //   // maxDate: DateTime.now().add(
              //   //   Duration(days: 365),
              //   // ),
              //   onDatePressed: (DateTime datetime) {
              //     // Do something
              //   },
              //   onDateLongPressed: (DateTime datetime) {
              //     // Do something
              //   },
              //   onWeekChanged: () {
              //     // Do something
              //   },
              //   monthViewBuilder: (DateTime time) => Align(
              //     alignment: FractionalOffset.center,
              //     child: Container(
              //       margin: const EdgeInsets.symmetric(
              //           vertical: 4),
              //     ),
              //   ),
              //   decorations: [
              //     DecorationItem(
              //       decorationAlignment:
              //           FractionalOffset.bottomRight,
              //       date: DateTime.now(),
              //     ),
              //     DecorationItem(
              //       date:
              //           DateTime.now().add(Duration(days: 3)),
              //     ),
              //   ],
              // ),
              SizedBox(height: 2.h),
              Container(
                height: 6.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kPrimaryGrey)),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedTime = index;
                            });
                          },
                          child: Container(
                            height: 4.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.topRight,
                                    colors: selectedTime == index
                                        ? [kprimegradient, kPrimaryOrange]
                                        : [
                                            kprimarytransprnt.withOpacity(0.1),
                                            kprimarytransprnt.withOpacity(0.1)
                                          ])),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(0.5.h),
                                child: Text(
                                  '17:00',
                                  style: TextStyle(
                                      fontFamily: 'SFPro', fontSize: 10.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
