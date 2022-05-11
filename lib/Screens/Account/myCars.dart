import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../../Components/customTextField2.dart';
import '../../Components/custom_button_gradient.dart';
import '../../Components/custom_textFeild.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class MyCarsScreen extends StatefulWidget {
  const MyCarsScreen({Key? key}) : super(key: key);

  @override
  State<MyCarsScreen> createState() => _MyCarsScreenState();
}

class _MyCarsScreenState extends State<MyCarsScreen> {
  int? selectedIndex = 0;
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
                  child: Text('My Cars',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 2.h),
                        Container(
                          height: 10.h,
                          //color: Colors.amber,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: kPrimaryOrange),
                                        color: kPrimaryWhite,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.h),
                                    width: 45.w,
                                    height: 7.h,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 1.h, vertical: 0.0.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Home',
                                              style: TextStyle(
                                                color: kPrimaryOrange,
                                                fontSize: 10.sp,
                                              )),
                                          SizedBox(height: 1.h),
                                          Text('678 Kienow Meadow, 448',
                                              style: TextStyle(
                                                color: kPrimaryGrey,
                                                fontSize: 10.sp,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            Widget continueButton = TextButton(
                                              child: Text("Yes",
                                                  style: TextStyle(
                                                    color: kPrimaryOrange,
                                                    fontSize: 12.sp,
                                                  )),
                                              onPressed: () {},
                                            );
                                            return new AlertDialog(
                                              title: new Text("Delete",
                                                  style: TextStyle(
                                                    color: kPrimaryBlack,
                                                    fontSize: 16.sp,
                                                  )),
                                              content: new Text("Are you sure?",
                                                  style: TextStyle(
                                                    color: kPrimaryGrey,
                                                    fontSize: 14.sp,
                                                  )),
                                              actions: [continueButton],
                                            );
                                          });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 43.5.w, top: 0.h),
                                      height: 2.5.h,
                                      width: 2.5.h,
                                      decoration: BoxDecoration(
                                          color: kPrimaryOrange,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(child: Image.asset(cancel)),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 0.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add New Vehicale',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp)),
                              SizedBox(height: 2.h),
                              Text('Vehicale Type',
                                  style: TextStyle(
                                      color: kPrimaryGrey, fontSize: 14.sp)),
                              SizedBox(height: 2.h),
                              Container(
                                height: 4.h,
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
                                      child: Container(
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.topRight,
                                                colors: selectedIndex == index
                                                    ? [
                                                        kprimegradient,
                                                        kPrimaryOrange
                                                      ]
                                                    : [
                                                        kprimarytransprnt
                                                            .withOpacity(0.1),
                                                        kprimarytransprnt
                                                            .withOpacity(0.1)
                                                      ])),
                                        margin: EdgeInsets.only(left: 1.5.h),
                                        // height: 2.h,
                                        child: Center(
                                          child: Text(VehicalTypes[index],
                                              style: TextStyle(
                                                  color: selectedIndex == index
                                                      ? kPrimaryWhite
                                                      : kPrimaryGrey,
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
                                    color: kPrimaryGrey,
                                    fontSize: 14.sp,
                                  )),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Vehical Brand',
                                  textEditingController:
                                      appPro.vehicalBrandName,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Vehical Model',
                                  textEditingController:
                                      appPro.vehicalBrandName,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Vehical Registeration Number',
                                  textEditingController: appPro.vehicalBrandC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 2.h),
                              CustomButtonGradient(
                                  title: 'Save',
                                  onTap: () {},
                                  txtStyle: TextStyle(
                                      color: kPrimaryWhite, fontSize: 14.sp)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ));
    }));
  }
}
