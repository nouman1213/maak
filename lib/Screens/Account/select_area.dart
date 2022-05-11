import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppModels/getAreaList.dart';
import '../../AppProviders/Auth/locationRepo.dart';
import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';

class SelectArea extends StatefulWidget {
  SelectArea({Key? key}) : super(key: key);
  GetAreaList? getAreaList;

  @override
  State<SelectArea> createState() => _SelectAreaState();
}

class _SelectAreaState extends State<SelectArea> {
  @override
  void initState() {
    super.initState();
    fetchAreaList();
  }

  fetchAreaList() async {
    widget.getAreaList = await LocationRepo().fetchAreaList();
    debugPrint("AAAAAA : ${widget.getAreaList.toString()}");
  }

  String? groupValue;
  List<String> cityList = [
    'Kuwait City',
    'Dasman',
    'Sharq',
    'Mirgab',
    'Jibla',
    'Dasma',
    'Daiya',
    'Sawabir',
    'Salhiya',
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
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 14.sp,
                              fontFamily: 'SFPro',
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 5.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kPrimaryWhite),
                      child: TextFormField(
                        cursorColor: kPrimaryGrey,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (groupValue != null) {
                          appPro.setArea(cityList[int.parse(groupValue!)]);
                        }
                        Navigator.pop(context);
                        //print(groupValue);
                      },
                      child: Text('Done',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 14.sp,
                              fontFamily: 'SFPro',
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        Container(
                          height: 4.h,
                          width: double.infinity,
                          color: Colors.grey[400],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(0.5.h),
                                child: Text('Al Asimah Governorate',
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 12.sp,
                                      fontFamily: 'SFPro',
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: cityList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Container(
                                  height: 7.h,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(cityList[index].toString(),
                                              style: TextStyle(
                                                color: kPrimaryBlack,
                                                fontSize: 12.sp,
                                                fontFamily: 'SFPro',
                                              )),
                                          Spacer(),
                                          Container(
                                            height: 2.h,
                                            child: Radio(
                                              value: index.toString(),
                                              groupValue: groupValue,
                                              onChanged: (dynamic newValue) {
                                                setState(() =>
                                                    groupValue = newValue);
                                                print(groupValue);
                                              },
                                              activeColor: kPrimaryOrange,
                                              // selected: false,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 1.h),
                                      Divider(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ));
    }));
  }
}
