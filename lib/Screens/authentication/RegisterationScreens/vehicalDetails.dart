import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../../Components/custonButtonWite.dart';
import '../../Const/colors.dart';
import '../../Home/bottomNavigationBar.dart';
import 'google_map.dart';

class VehicalDetails extends StatefulWidget {
  VehicalDetails({Key? key}) : super(key: key);

  @override
  State<VehicalDetails> createState() => _VehicalDetailsState();
}

class _VehicalDetailsState extends State<VehicalDetails> {
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Container(
                      child: Text('Welcome John!',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFPro',
                              fontSize: 16.sp))),
                  SizedBox(height: 2.h),
                  Text('Before we start please add few details !!',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 12.sp)),
                  SizedBox(height: 2.h),
                  // Container(
                  //   height: 12.h,
                  //   width: 100.w,
                  //   decoration: BoxDecoration(
                  //       color: kPrimaryWhite,
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: ListView.builder(
                  //     itemCount: vehicalsDetails.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Column(
                  //         children: [],
                  //       );
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: 4.h),
                  Text('Vehicale Type',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SFPro',
                          fontSize: 14.sp)),
                  SizedBox(height: 2.h),
                  Container(
                    height: 4.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: VehicalTypes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 20.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: selectedIndex == index
                                  ? kPrimaryWhite
                                  : Colors.transparent,
                            ),
                            margin: EdgeInsets.only(left: 1.5.h),
                            // height: 2.h,
                            child: Center(
                              child: Text(VehicalTypes[index],
                                  style: TextStyle(
                                      color: selectedIndex == index
                                          ? kPrimaryOrange
                                          : kPrimaryWhite,
                                      fontSize: 10.sp)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text('Vehical Details',
                      style: TextStyle(
                        color: kPrimaryWhite,
                        fontSize: 14.sp,
                        fontFamily: 'SFPro',
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 1.h),
                  customTextField(  validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Vehical Details';
                            } else {
                              return null;
                            }
                            
                          },
                      hintText: 'Vehical Brand',
                      textEditingController: appPro.vehicalBrandC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 1.h),
                  customTextField(  validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Vehical Brand';
                            } else {
                              return null;
                            }
                            
                          },
                      hintText: 'Vehical Brand',
                      textEditingController: appPro.vehicalBrandName,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 1.h),
                  customTextField(  validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Vehical Brand';
                            } else {
                              return null;
                            }
                            
                          },
                      hintText: 'Vehical Registeration Number',
                      textEditingController: appPro.vehicalBrandC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 2.h),
                  Row(children: [
                    Spacer(),
                    InkWell(
                        onTap: (() {}),
                        child: Text('Add More',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontFamily: 'SFPro',
                                fontSize: 14.sp)))
                  ]),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        BottomNavigationBarScreen()));
                          },
                          child: Text('Skip',
                              style: TextStyle(
                                  color: kPrimaryWhite,
                                  fontFamily: 'SFPro',
                                  fontSize: 14.sp)),
                        ),
                        Spacer(),
                        customButtonWhite(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => GoogleMapScreen()));
                          },
                          title: 'Next',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
