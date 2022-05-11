import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

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
                          height: 4.h,
                          width: 4.h,
                          child: Icon(
                            Icons.arrow_back,
                            color: kPrimaryWhite,
                          ))),
                ),
                Container(
                    margin: EdgeInsets.only(left: 3.h),
                    child: Text('Bookmark',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    color: Colors.grey[200],
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        color: kPrimaryOrange,
                        axisDirection: AxisDirection.down,
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.all(1.h),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => BookingStatus()));
                                },
                                child: Container(
                                  height: 12.h,
                                  decoration: BoxDecoration(
                                      color: kPrimaryWhite,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 0.h),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h,
                                                horizontal: 1.5.h),
                                            child: Container(
                                              height: 9.h,
                                              width: 15.h,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image:
                                                          AssetImage(image1)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),

                                              // width: 12.w,
                                            )),
                                        Container(
                                          margin: EdgeInsets.only(top: 3.h),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Matt's Automotive...",
                                                  style: TextStyle(
                                                      color: kPrimaryBlack,
                                                      fontSize: 14.sp)),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 0.5.h),
                                                child: Row(
                                                  children: [
                                                    Image.asset(star1),
                                                    SizedBox(width: 1.h),
                                                    Text('4.5 - 254 Reviews',
                                                        style: TextStyle(
                                                            color: kPrimaryGrey,
                                                            fontSize: 12.sp))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      }),
    ));
  }
}
