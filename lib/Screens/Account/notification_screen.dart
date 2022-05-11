import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
                      height: 4.h,
                      width: 4.h,
                      child: Icon(
                        Icons.arrow_back,
                        color: kPrimaryWhite,
                      ),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3.h),
                  child: Text('Notification',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 16.sp,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: ListTile(
                                title: Text('Booking Rejected',
                                    style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontSize: 14.sp,
                                      fontFamily: 'SFPro',
                                    )),
                                subtitle: Text(
                                    'Your booking has been Rejected by CarSpa',
                                    style: TextStyle(
                                      color: kPrimaryGrey,
                                      fontSize: 14.sp,
                                      fontFamily: 'SFPro',
                                    )),
                              ),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    )),
              ),
            ],
          ));
    }));
  }
}
