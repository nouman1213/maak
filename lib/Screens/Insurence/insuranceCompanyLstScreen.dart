import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import 'delail.dart';

class InsurnceCompanyListScreen extends StatefulWidget {
  const InsurnceCompanyListScreen({Key? key}) : super(key: key);

  @override
  State<InsurnceCompanyListScreen> createState() =>
      _InsurnceCompanyListScreenState();
}

class _InsurnceCompanyListScreenState extends State<InsurnceCompanyListScreen> {
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
                    padding: EdgeInsets.only(left: 2.h, top: 8.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: kPrimaryWhite,
                      ),
                    )),
                SizedBox(height: 2.h),
                TabBar(
                    labelStyle: TextStyle(fontSize: 14.sp),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    padding: EdgeInsets.all(0),
                    indicatorColor: kPrimaryWhite,
                    tabs: [
                      Tab(
                        text: 'Comprehensive',
                      ),
                      Tab(
                        text: '3rd Party',
                      ),
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  Details(),
                  Details(),
                ]))
              ],
            ),
          );
        }),
      )),
    );
  }
}
