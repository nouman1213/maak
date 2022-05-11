import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../Components/customTextField2.dart';
import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import 'insuranceCompanyLstScreen.dart';

class InsuranceMainScreen extends StatefulWidget {
  InsuranceMainScreen({Key? key}) : super(key: key);

  @override
  State<InsuranceMainScreen> createState() => _InsuranceMainScreenState();
}

var Vehicalbrand = 'Vehical Brand';
var items = ['ACURA', 'ALFA ROMEO', 'AUDI', 'BMW', 'BUICK'];
var Vehicalmodel = 'Vehical Model';
var model = ['Torpdo HP', 'Stradle', 'Sprint', 'ALFA ', 'Sport'];
var year = 'Year Manufacture';
var Myear = ['2018', '2019', '2020', '2021', '2022'];

class _InsuranceMainScreenState extends State<InsuranceMainScreen> {
  List<String> VehicalTypes = [
    'Compact',
    'Sedan',
    'Wagon',
    'SUV',
    'Luxury',
    'sports',
    'Wagon',
    'SUV',
    'Luxury',
  ];
  List<String> vehicalNames = [
    'MITSUBISHI',
    'MITSUBISHI',
    'MITSUBISHI',
    'MITSUBISHI',
    'MITSUBISHI',
  ];
  List<String> vehicalsubtitle = [
    'MITSUBISHI Outlander',
    'MITSUBISHI Outlander',
    'MITSUBISHI Outlander',
    'MITSUBISHI Outlander',
    'MITSUBISHI Outlander',
  ];
  int? selectedIndex = 0;
  List<String> vehicalsDetails = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppProvider>(builder: (context, appPro, _) {
      return SingleChildScrollView(
        child: Container(
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
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 3.h,
                        width: 3.h,
                        child: Icon(
                          Icons.arrow_back,
                          color: kPrimaryWhite,
                        ),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(left: 3.h),
                    child: Text('Insurance',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 14.sp,
                            fontFamily: 'SFPro',
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    height: 100.h,
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 8.4.h,
                                //color: Colors.amber,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: vehicalNames.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: kPrimaryGrey),
                                              color: kPrimaryWhite,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          margin: EdgeInsets.all(1.h),
                                          width: 40.w,
                                          height: 8.h,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h,
                                                vertical: 0.5.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(vehicalNames[index],
                                                    style: TextStyle(
                                                      color: kPrimaryOrange,
                                                      fontFamily: 'SFPro',
                                                      fontSize: 9.sp,
                                                    )),
                                                SizedBox(height: 1.h),
                                                Text(vehicalsubtitle[index],
                                                    style: TextStyle(
                                                      color: kPrimaryGrey,
                                                      fontFamily: 'SFPro',
                                                      fontSize: 8.sp,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return new AlertDialog(
                                                    title: new Text("MAAK",
                                                        style: TextStyle(
                                                          color: kPrimaryBlack,
                                                          fontFamily: 'SFPro',
                                                          fontSize: 14.sp,
                                                        )),
                                                    content: new Text(
                                                        "Do you want to delete this vehicals",
                                                        style: TextStyle(
                                                          color: kPrimaryGrey,
                                                          fontFamily: 'SFPro',
                                                          fontSize: 14.sp,
                                                        )),
                                                    actions: [
                                                      TextButton(
                                                        child: Text("Yes",
                                                            style: TextStyle(
                                                              color:
                                                                  kPrimaryOrange,
                                                              fontFamily:
                                                                  'SFPro',
                                                              fontSize: 12.sp,
                                                            )),
                                                        onPressed: () {
                                                          vehicalNames
                                                              .remove(index);
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text('No',
                                                            style: TextStyle(
                                                              color:
                                                                  kPrimaryOrange,
                                                              fontFamily:
                                                                  'SFPro',
                                                              fontSize: 12.sp,
                                                            )),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(left: 40.w),
                                            height: 2.5.h,
                                            width: 2.5.h,
                                            decoration: BoxDecoration(
                                                color: kPrimaryOrange,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Center(
                                                child: Image.asset(cancel)),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Text('Vehicale Type',
                                    style: TextStyle(
                                        color: kPrimaryGrey,
                                        fontFamily: 'SFPro',
                                        fontSize: 14.sp)),
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                height: 12.h,
                                child: GlowingOverscrollIndicator(
                                  color: kPrimaryOrange,
                                  axisDirection: AxisDirection.right,
                                  child: ScrollConfiguration(
                                    behavior: ScrollBehavior(),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: VehicalTypes.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = index;
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Image.asset(carone),
                                                Container(
                                                  height: 5.h,
                                                  width: 20.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(30),
                                                      gradient: LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .topRight,
                                                          colors:
                                                              selectedIndex ==
                                                                      index
                                                                  ? [
                                                                      kprimegradient,
                                                                      kPrimaryOrange
                                                                    ]
                                                                  : [
                                                                      kprimarytransprnt
                                                                          .withOpacity(
                                                                              0.1),
                                                                      kprimarytransprnt
                                                                          .withOpacity(
                                                                              0.1)
                                                                    ])),
                                                  margin: EdgeInsets.only(
                                                      left: 1.5.h),
                                                  // height: 2.h,
                                                  child: Center(
                                                    child: Text(
                                                        VehicalTypes[index],
                                                        style: TextStyle(
                                                            color: selectedIndex ==
                                                                    index
                                                                ? kPrimaryWhite
                                                                : kPrimaryGrey,
                                                            fontSize: 10.sp)),
                                                  ),
                                                ),
                                              ],
                                            ));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                child: Row(
                                  children: [
                                    Text(Vehicalbrand,
                                        style: TextStyle(
                                            color: kPrimaryGrey,
                                            fontFamily: 'SFPro',
                                            fontSize: 10.sp)),
                                    Spacer(),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 4.h,

                                          //value: addressType,
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              Vehicalbrand = newValue!;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                child: Row(
                                  children: [
                                    Text(Vehicalmodel,
                                        style: TextStyle(
                                            color: kPrimaryGrey,
                                            fontFamily: 'SFPro',
                                            fontSize: 10.sp)),
                                    Spacer(),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 4.h,

                                          //value: addressType,
                                          items: model.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              Vehicalmodel = newValue!;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              customTextField2(
                                  hintText: 'Insurance Value',
                                  textEditingController: appPro.numberC,
                                  textInputType: TextInputType.number,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                                child: Row(
                                  children: [
                                    Text(year,
                                        style: TextStyle(
                                            color: kPrimaryGrey,
                                            fontFamily: 'SFPro',
                                            fontSize: 10.sp)),
                                    Spacer(),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 4.h,

                                          //value: addressType,
                                          items: Myear.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              year = newValue!;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h),
                              CustomButtonGradient(
                                  title: 'Continue',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                InsurnceCompanyListScreen()));
                                  },
                                  txtStyle: TextStyle(
                                      color: kPrimaryWhite, fontSize: 14.sp)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
    }));
  }
}
