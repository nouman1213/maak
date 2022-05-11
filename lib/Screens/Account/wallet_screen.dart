import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Account/addToWallet.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import '../Insurence/addMoneytoWallet.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

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
                        ),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(left: 3.h),
                    child: Text('Wallet',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 3.h),
                        child: Text('5000 KWD',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold))),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AddMoneyToWallet()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 2.h),
                        height: 4.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                            color: kPrimaryWhite,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text('+',
                              style: TextStyle(
                                  color: kPrimaryOrange,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2.h),
                            Container(
                              margin: EdgeInsets.only(left: 2.h),
                              child: Text('Recents',
                                  style: TextStyle(
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                            ),
                            Expanded(
                              child: GlowingOverscrollIndicator(
                                color: kPrimaryOrange,
                                axisDirection: AxisDirection.down,
                                child: ScrollConfiguration(
                                  behavior: ScrollBehavior(),
                                  child: ListView.builder(
                                    itemCount: 15,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title:
                                            Text('Paid to Quick Lane Services',
                                                style: TextStyle(
                                                  color: kPrimaryBlack,
                                                  fontSize: 14.sp,
                                                )),
                                        subtitle:
                                            Text('3:30 pm - Balance 20 KWD',
                                                style: TextStyle(
                                                  color: kPrimaryGrey,
                                                  fontSize: 12.sp,
                                                )),
                                        trailing: Text('- 150 KWD',
                                            style: TextStyle(
                                                color: kPrimaryOrange,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ));
      }),
    ));
  }
}
