import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Account/select_area.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../../Components/customTextField2.dart';
import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({Key? key}) : super(key: key);

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  int? selectedIndex = 0;
  var addressType = '--Address Type--';
  var selectArea = 'Select Area';

  var items = ['--Address Type--', 'Home', 'Office'];
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
                  margin: EdgeInsets.only(left: 3.h),
                  child: Text('My Address',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 16.sp,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 2.h),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add New Address',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp)),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Text(addressType,
                                      style: TextStyle(
                                          color: kPrimaryBlack,
                                          fontFamily: 'SFPro',
                                          fontSize: 14.sp)),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 1.h),
                                    child: DropdownButtonHideUnderline(
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
                                              addressType = newValue!;
                                            });
                                          }),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  Text(
                                      appPro.myArea != null
                                          ? appPro.myArea!
                                          : 'Select Area',
                                      style: TextStyle(
                                          color: kPrimaryGrey,
                                          fontFamily: 'SFPro',
                                          fontSize: 14.sp)),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => SelectArea()));
                                      },
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        size: 4.h,
                                        color: kPrimaryGrey,
                                      ))
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Block',
                                          textEditingController: appPro.blockC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Street',
                                          textEditingController: appPro.streetC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Avenu',
                                  textEditingController: appPro.buildingNameC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 1.h),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Building Name',
                                  textEditingController: appPro.buildingNameC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 1.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Flore',
                                          textEditingController: appPro.floorC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Additional Direction',
                                          textEditingController:
                                              appPro.aditionalDirectionC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Landline Number',
                                  textEditingController: appPro.landlinNumberC,
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
