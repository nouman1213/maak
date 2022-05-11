import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Account/notification_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../AppProviders/appProvider.dart';
import '../Account/editProfile.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import '../Insurence/insuranceMain_screen.dart';
import '../Road/raod_screen.dart';
import '../Wash/wash_main_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List allServices = [
    InsuranceMainScreen(),
    WashMAinScreen(),
    RoadScreen(),
    // WashTabBarScreen(),
  ];

  List<String> title = [
    'Insurance',
    'Wash',
    'Road',
    'Mechanic',
    'Tiers',
    'Insurance',
  ];
  List<String> logo = [
    emergency,
    wash,
    polish,
    mechanic,
    tiers,
    emergency,
  ];
  @override
  Widget build(BuildContext context) {
    var appPro = AppProvider();
    final List<Widget> imageSliders = appPro.imgList
        .map((item) => Container(
              //  margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            ))
        .toList();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: kPrimaryOrange,
          child: Consumer<AppProvider>(builder: (context, appPro, _) {
            return Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      curveBg,
                      width: 100.w,
                      // scale: 3.6,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.h),
                      height: 15.h,
                      // color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(logo4, height: 6.h),
                            SizedBox(width: 0.w),
                            //Spacer(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => EditProfile()));
                                  },
                                  child: CircleAvatar(
                                      backgroundColor: kPrimaryBlack,
                                      radius: 3.5.h,
                                      backgroundImage:
                                          AssetImage(profileImage)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 0.h),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    NotificationScreen()));
                                      },
                                      icon: Icon(
                                        Icons.notifications,
                                        size: 4.h,
                                        color: kPrimaryWhite,
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    flex: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.h, vertical: 2.h),
                                child: Card(
                                  elevation: 3,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 0.h),
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kPrimaryGrey),
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: CarouselSlider(
                                        items: imageSliders,
                                        carouselController: appPro.controller,
                                        options: CarouselOptions(
                                            height: 180.0,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                            aspectRatio: 16 / 9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            enableInfiniteScroll: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 800),
                                            viewportFraction: 1,
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                appPro.current = index;
                                              });
                                            })),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.only(top: 22.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    appPro.imgList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => appPro.controller
                                        .animateToPage(entry.key),
                                    child: Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : kPrimaryOrange)
                                              .withOpacity(
                                                  appPro.current == entry.key
                                                      ? 0.9
                                                      : 0.4)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                top: 0.h, left: 2.h, bottom: 0.h),
                            child: Text('Book a Servises',
                                style: TextStyle(
                                    color: kPrimaryBlack,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SFPro',
                                    fontSize: 16.sp))),
                        SizedBox(height: 02.h),
                        Container(
                          // color: Colors.amber,
                          height: 34.h,
                          width: 100.w,
                          // margin: EdgeInsets.only(top: 56),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: allServices.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => allServices[index]));
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 0.5.h),
                                        child: CircleAvatar(
                                            backgroundColor: Colors.grey[100],
                                            radius: 4.h,
                                            backgroundImage:
                                                AssetImage(logo[index]))),
                                    Text(title[index].toString(),
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'SFPro',
                                            fontSize: 11.sp)),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            );
          }),
        ),
      ),
    );
  }
}
