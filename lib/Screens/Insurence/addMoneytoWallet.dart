import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';

class AddMoneyTOWalletScreen extends StatefulWidget {
  AddMoneyTOWalletScreen({Key? key}) : super(key: key);

  @override
  State<AddMoneyTOWalletScreen> createState() => _AddMoneyTOWalletScreenState();
}

String? groupvalue;
bool? isTextclrchng = false;
int? isContnrclrchng;

class _AddMoneyTOWalletScreenState extends State<AddMoneyTOWalletScreen> {
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
                      Text('Add Money to Wallet',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontFamily: 'SFPro',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('120.0 KWD',
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontFamily: 'SFPro',
                            fontSize: 10.sp,
                          )),
                    ],
                  )),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, left: 6.w, right: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text('Balance 2823.45    KWD',
                                style: TextStyle(
                                    color: kPrimaryOrange,
                                    fontFamily: 'SFPro',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp)),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Text(
                            'Select Amount',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'SFPro',
                                color: kPrimaryGrey),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              // width: double.infinity,
                              child: ListView.builder(
                                  itemCount: 3,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.only(top: 2.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 5.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(colors: [
                                                kprimegradient,
                                                kPrimaryOrange
                                              ]),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '60.000',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontFamily: 'SFPro',
                                                      color: kPrimaryWhite,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  'KWD',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: kPrimaryWhite,
                                                      fontFamily: 'SFPro',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Free Credit',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontFamily: 'SFPro',
                                                    color: kPrimaryGrey),
                                              ),
                                              Text(
                                                '20.000  KWD',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontFamily: 'SFPro',
                                                    color: kPrimaryOrange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                isContnrclrchng = index;
                                                isTextclrchng = !isTextclrchng!;
                                              });
                                            },
                                            child: Container(
                                              height: 4.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: kPrimaryOrange),
                                                  gradient: LinearGradient(
                                                      colors: isContnrclrchng ==
                                                              index
                                                          ? [
                                                              kprimegradient,
                                                              kPrimaryOrange
                                                            ]
                                                          : [
                                                              kprimarytransprnt,
                                                              kprimarytransprnt
                                                            ])),
                                              child: Center(
                                                  child: Text(
                                                'Select',
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontFamily: 'SFPro',
                                                    color:
                                                        isContnrclrchng == index
                                                            ? kPrimaryWhite
                                                            : kPrimaryOrange),
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ),

                          Divider(
                            thickness: 1,
                            color: kPrimaryBlack,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Select Payment Option',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'SFPro',
                                color: kPrimaryGrey),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'Stripe',
                                groupValue: groupvalue,
                                onChanged: (dynamic newValue) {
                                  setState(() => groupvalue = newValue);
                                },
                                activeColor: kPrimaryOrange,

                                // selected: false,
                              ),
                              Text(
                                "K-net",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: 'SFPro',
                                ),
                              ),
                            ],
                          ),
                          //  SizedBox(height: 1.h,),
                          Row(
                            children: [
                              Radio(
                                value: 'crdircard',
                                groupValue: groupvalue,
                                onChanged: (dynamic newValue) {
                                  setState(() => groupvalue = newValue);
                                },
                                activeColor: kPrimaryOrange,

                                // selected: false,
                              ),
                              Text(
                                "Credit Card",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: 'SFPro',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          CustomButtonGradient(
                              title: 'Pay Now',
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>InsurnceCompanyListScreen()));
                              },
                              txtStyle: TextStyle(
                                  color: kPrimaryWhite,
                                  fontFamily: 'SFPro',
                                  fontSize: 14.sp)),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ));
    }));
  }
}
