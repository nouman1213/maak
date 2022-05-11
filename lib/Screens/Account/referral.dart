import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class ReferralScreen extends StatefulWidget {
  ReferralScreen({Key? key}) : super(key: key);

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
  String promocode = 'MAAK 007';

  bool isCopied = false;

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
                    child: Text('Referral',
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
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Column(
                            children: [
                              SizedBox(height: 3.h),
                              Text(
                                  'Spread the world and get super great Discount when you avail services',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                              SizedBox(height: 12.h),
                              Text('PROMO CODE',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 2.h),
                              Container(
                                height: 15.h,
                                width: 90.h,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        // filterQuality: FilterQuality.high,

                                        image: AssetImage(
                                            "assets/images/bggg.png"))),
                                child: Center(
                                  child: Text(promocode,
                                      style: TextStyle(
                                          color: kPrimaryOrange,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isCopied = true;
                                    });
                                    FlutterClipboard.copy(promocode);
                                    // showSnackBar(
                                    //     'Text Copied Successfully', promocode);
                                  },
                                  icon: Image.asset(
                                    clipboard,
                                    color: isCopied
                                        ? kPrimaryOrange
                                        : kPrimaryGrey,
                                  ),
                                  iconSize: 30),
                              Text(
                                  isCopied
                                      ? 'Code are copied'
                                      : 'Copy to Clipboard',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 16.sp,
                                  )),
                            ],
                          ),
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
