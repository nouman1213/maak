import 'package:flutter/material.dart';
import 'package:maak_prject/AppProviders/appProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import '../Insurence/addMoneytoWallet.dart';

class SelectPaymentOptionWashScreen extends StatefulWidget {
  SelectPaymentOptionWashScreen({Key? key}) : super(key: key);

  @override
  State<SelectPaymentOptionWashScreen> createState() =>
      _SelectPaymentOptionWashScreenState();
}

bool? isBalance = false;
bool? isOrange = false;
bool? knet = false;
bool? cCard = false;
double? avalaibleBalance = 2823.45;
double? priceKWD = 6.0;
var result = avalaibleBalance! - priceKWD!;
var formKey = GlobalKey<FormState>();

class _SelectPaymentOptionWashScreenState
    extends State<SelectPaymentOptionWashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppProvider>(builder: (context, appPro, _) {
      return Container(
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
              SizedBox(height: 3.h),
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
                  margin: EdgeInsets.only(left: 3.h, right: 3.w),
                  child: Row(
                    children: [
                      Text('Select Payment option',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontFamily: 'SFPro',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('${priceKWD} KWD',
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontFamily: 'SFPro',
                            fontSize: 12.sp,
                          )),
                    ],
                  )),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 6.w,
                              ),
                              child: Text('Enter Coupon Code',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp)),
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 6.w,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 5.h,
                                      width: 60.w,
                                      child: TextFormField(
                                          controller: appPro.couponC,
                                          key: formKey,
                                          cursorColor: kPrimaryGrey,
                                          decoration: InputDecoration(
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              kPrimaryBlack)),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              kPrimaryBlack))),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Coupon code required';
                                            }
                                            return '';
                                          }),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            appPro.couponC.clear();
                                          },
                                          child: CircleAvatar(
                                            radius: 1.5.h,
                                            backgroundColor: kPrimaryOrange,
                                            child: Icon(
                                              Icons.close,
                                              color: kPrimaryWhite,
                                              size: 2.5.h,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              gradient: LinearGradient(colors: [
                                                kprimegradient,
                                                kPrimaryOrange
                                              ]),
                                            ),
                                            height: 4.h,
                                            width: 20.w,
                                            child: Center(
                                              child: Text(
                                                'Apply',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: 'SFPro',
                                                    color: kPrimaryWhite),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3.h),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 4.h),
                                child: Text(
                                  'Add New Address',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'SFPro',
                                      color: kPrimaryBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 6.w,
                              ),
                              child: Container(
                                height: 10.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: kPrimaryGrey)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.h, vertical: 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Service Date and time',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'SFPro',
                                                color: kPrimaryOrange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            '15:30bon 2022-04-22',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontFamily: 'SFPro',
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Edit',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kPrimaryGrey,
                                            fontFamily: 'SFPro',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 6.w,
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isOrange = true;
                                        cCard = false;
                                        knet = false;
                                      });
                                    },
                                    child: Container(
                                      height: 3.5.h,
                                      width: 7.w,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: kPrimaryGrey),
                                          color: isOrange!
                                              ? kPrimaryOrange
                                              : kprimarytransprnt),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    '${priceKWD}',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'SFPro',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 16.2.w, right: 6.w),
                              child: Row(
                                children: [
                                  Text(
                                    'Available balance: ${avalaibleBalance} KWD',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: 'SFPro',
                                        color: kPrimaryGrey),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  AddMoneyTOWalletScreen()));
                                    },
                                    child: Text(
                                      'Add Money',
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: 'SFPro',
                                          color: kPrimaryOrange),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 6.w,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Comprehensive Insurance',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'SFPro',
                                        color: kPrimaryGrey),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${priceKWD}',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: 'SFPro',
                                        color: kPrimaryGrey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.w,
                                right: 6.w,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Minus Wallet Balance',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'SFPro',
                                        color: kPrimaryGrey),
                                  ),
                                  Spacer(),
                                  Text(
                                    '0 KWD',
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: 'SFPro',
                                        color: kPrimaryGrey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              height: 13.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kPrimaryOrange.withOpacity(0.1),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.w, right: 6.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Minus Wallet Balance',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: kPrimaryBlack,
                                                  fontFamily: 'SFPro',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Text(
                                              '${priceKWD}',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: kPrimaryBlack,
                                                  fontFamily: 'SFPro',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.w, right: 6.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              'User Application Fee',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: 'SFPro',
                                                color: kPrimaryGrey,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '0.0 KWD',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontFamily: 'SFPro',
                                                  color: kPrimaryGrey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 6.w, right: 6.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Payable Amount',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: kPrimaryBlack,
                                                  fontFamily: 'SFPro',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Text(
                                              '${priceKWD}',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: kPrimaryBlack,
                                                  fontFamily: 'SFPro',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        knet = true;
                                        isOrange = false;
                                        cCard = false;
                                      });
                                    },
                                    child: knet!
                                        ? Image.asset(radio2_on)
                                        : Image.asset(radio_0),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "K-net",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'SFPro',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: EdgeInsets.only(left: 2.w),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        cCard = true;
                                        isOrange = false;
                                        knet = false;
                                      });
                                    },
                                    child: cCard!
                                        ? Image.asset(
                                            radio2_on,
                                          )
                                        : Image.asset(radio_0),
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "Credit Card",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'SFPro',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: CustomButtonGradient(
                                  title: 'Pay Now',
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddMoneyTOWalletScreen()));
                                  },
                                  txtStyle: TextStyle(
                                      color: kPrimaryWhite,
                                      fontFamily: 'SFPro',
                                      fontSize: 14.sp)),
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ));
    }));
  }
}
