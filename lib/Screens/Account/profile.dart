import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Account/editProfile.dart';
import 'package:maak_prject/Screens/Account/myAddress.dart';
import 'package:maak_prject/Screens/Account/myCars.dart';
import 'package:maak_prject/Screens/Account/referral.dart';
import 'package:maak_prject/Screens/Account/wallet_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import 'bookMark.dart';
import 'chat.dart';
import 'our_partners.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;
  bool isLanEnSelect = true;
  bool isLanArSelect = false;
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
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // InkWell(
                    //     onTap: () {
                    //       // Navigator.pop(context);
                    //     },
                    //     child: Container(
                    //
                    //       height: 4.h, width: 4.h, child: Image.asset(back))),

                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditProfile()));
                      },
                      child: Container(
                          child: Text('Edit',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontFamily: 'SFPro',
                                  fontSize: 14.sp))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryBlack,
                    radius: 6.h,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 16.sp,
                            fontFamily: 'SFPro',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 1.h),
                      Text('+956 8878 222534',
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 12.sp,
                            fontFamily: 'SFPro',
                          )),
                      SizedBox(height: 1.h),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => WalletScreen()));
                        },
                        child: Container(
                          height: 5.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: kPrimaryWhite,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text('Wallet Money : 500 KWD',
                                style: TextStyle(
                                  color: kPrimaryOrange,
                                  fontFamily: 'SFPro',
                                  fontSize: 12.sp,
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: GlowingOverscrollIndicator(
                      color: kPrimaryOrange,
                      axisDirection: AxisDirection.down,
                      child: ScrollConfiguration(
                        behavior: ScrollBehavior(),
                        child: ListView(children: [
                          Text('Settings',
                              style: TextStyle(
                                  color: kPrimaryBlack,
                                  fontFamily: 'SFPro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp)),
                          Divider(
                            height: 4.h,
                            thickness: 1,
                            color: kPrimaryBlack,
                          ),
                          Row(
                            children: [
                              Text('Notification',
                                  style: TextStyle(
                                      color: kPrimaryGrey,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                              Spacer(),
                              CupertinoSwitch(
                                //thumbColor: kPrimaryOrange,
                                activeColor: kPrimaryOrange,
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Text('Language',
                                  style: TextStyle(
                                      color: kPrimaryGrey,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                              Spacer(),
                              Container(
                                height: 4.h,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: kPrimaryWhite,
                                    border: Border.all(color: kPrimaryOrange),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isLanArSelect = false;
                                          isLanEnSelect = true;
                                        });
                                      },
                                      child: Container(
                                        height: 5.h,
                                        width: 18.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: isLanEnSelect
                                              ? kPrimaryOrange
                                              : kPrimaryWhite,
                                        ),
                                        child: Center(
                                          child: Text('English',
                                              style: TextStyle(
                                                  fontFamily: 'SFPro',
                                                  color: isLanEnSelect
                                                      ? kPrimaryWhite
                                                      : kPrimaryOrange,
                                                  fontSize: 12.sp)),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isLanArSelect = true;
                                          isLanEnSelect = false;
                                        });
                                      },
                                      child: Expanded(
                                        child: Container(
                                          // padding: EdgeInsets.only(left: 2.h),

                                          width: 18.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: isLanArSelect
                                                ? kPrimaryOrange
                                                : kPrimaryWhite,
                                          ),
                                          child: Center(
                                            child: Text('Arabic ',
                                                style: TextStyle(
                                                    fontFamily: 'SFPro',
                                                    color: isLanArSelect
                                                        ? kPrimaryWhite
                                                        : kPrimaryOrange,
                                                    fontSize: 12.sp)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MyCarsScreen()));
                            },
                            child: Row(
                              children: [
                                Text('My Cars',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => MyAddressScreen()));
                            },
                            child: Row(
                              children: [
                                Text('My Address',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BookMarkScreen()));
                            },
                            child: Row(
                              children: [
                                Text('My Bookmark',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ChatScreen()));
                            },
                            child: Row(
                              children: [
                                Text('Live Chat',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                // Container(
                                //   margin: EdgeInsets.only(left: 2.h),
                                //   height: 3.h,
                                //   width: 3.h,
                                //   decoration: BoxDecoration(
                                //       color: kPrimaryOrange,
                                //       borderRadius: BorderRadius.circular(50)),
                                //   child: Center(
                                //     child: Text('3',
                                //         style: TextStyle(
                                //             color: kPrimaryWhite,
                                //             fontFamily: 'SFPro',
                                //             fontSize: 10.sp)),
                                //   ),
                                // ),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ReferralScreen()));
                            },
                            child: Row(
                              children: [
                                Text('Referral',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => OurPartners()));
                            },
                            child: Row(
                              children: [
                                Text('Our Partners',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => OurPartners()));
                            },
                            child: Row(
                              children: [
                                Text('Logout',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                                Spacer(),
                                Image.asset(
                                  next2,
                                  color: kPrimaryBlack,
                                  height: 3.h,
                                  width: 3.h,
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ));
    }));
  }
}
