import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Models/tabBarScreenModel.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Account/select_area.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import '../Wash/wash_screen2.dart';

class RoadTabBarScreen extends StatefulWidget {
  const RoadTabBarScreen({Key? key}) : super(key: key);

  @override
  State<RoadTabBarScreen> createState() => _RoadTabBarScreenState();
}

class _RoadTabBarScreenState extends State<RoadTabBarScreen> {
  List<TabBarScreenModel> tabBarSacreenModel = [
    TabBarScreenModel(
        title: "Matt's Automotive...",
        image: image1,
        ratingIcon: star1,
        rating: '4.5 - 254 Reviews',
        price: 'Starting Price : 5KWd'),
  ];
  List<TabBarScreenModel> topRated = [
    TabBarScreenModel(
        title: "Telegarage",
        image: car,
        ratingIcon: star1,
        rating: '2.5 - 259 Reviews',
        price: 'Starting Price : 15KWd'),
  ];
  int index = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 5.h, left: 0.h),
                    child: Text('Location',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 12.sp,
                            fontFamily: 'SFPro',
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 0.h),
                Padding(
                    padding: EdgeInsets.only(left: 2.h, top: 0.h),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                Icon(Icons.arrow_back, color: kPrimaryWhite)),
                        Container(
                          margin: EdgeInsets.only(left: 18.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  appPro.myArea != null
                                      ? appPro.myArea!
                                      : 'Select Area',
                                  style: TextStyle(
                                      color: kPrimaryWhite,
                                      fontSize: 12.sp,
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SelectArea()));
                                  },
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: kPrimaryWhite)),
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 2.h),
                TabBar(
                    labelStyle: TextStyle(fontSize: 14.sp),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    padding: EdgeInsets.all(0),
                    indicatorColor: kPrimaryWhite,
                    tabs: [
                      Tab(text: 'By Price'),
                      Tab(text: 'Top Rated'),
                      Tab(text: 'Best Seller'),
                    ]),
                Expanded(
                    child: TabBarView(children: [
                  WashScreen2(
                    tabBarScreenModel: tabBarSacreenModel,
                  ),
                  WashScreen2(
                    tabBarScreenModel: topRated,
                  ),
                  WashScreen2(
                    tabBarScreenModel: tabBarSacreenModel,
                  ),
                ]))
              ],
            ),
          );
        }),
      )),
    );
  }
}
