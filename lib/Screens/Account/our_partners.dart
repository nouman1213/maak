import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class OurPartners extends StatefulWidget {
  OurPartners({Key? key}) : super(key: key);

  @override
  State<OurPartners> createState() => _OurPartnersState();
}

class _OurPartnersState extends State<OurPartners> {
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
                        ))),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3.h),
                  child: Text('Our Partners',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold))),
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
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.h,
                                  decoration: BoxDecoration(
                                      color: kPrimaryWhite,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Image.asset(wash),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                    padding: EdgeInsets.only(top: 0),
                                    // margin: EdgeInsets.only(top: 8),
                                    child: Text('Logo Name',
                                        style: TextStyle(
                                          color: kPrimaryGrey,
                                          fontSize: 12.sp,
                                        ))),
                              ],
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
