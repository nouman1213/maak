import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../AppProviders/appProvider.dart';
import '../Screens/Const/colors.dart';
import '../Screens/Const/images.dart';

class CarTypeWidget extends StatefulWidget {
  const CarTypeWidget({Key? key}) : super(key: key);

  @override
  State<CarTypeWidget> createState() => _CarTypeWidgetState();
}

class _CarTypeWidgetState extends State<CarTypeWidget> {
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
  List<String> cars = [
    car,
    car,
    car,
    car,
    car,
    car,
    car,
    car,
    car,
  ];
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Column(
        children: [
          SizedBox(height: 2.h),
          Container(
            height: 10.h,
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
                    width: 10.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: selectedIndex == index
                                ? [kprimegradient, kPrimaryOrange]
                                : [
                                    kprimarytransprnt.withOpacity(0.1),
                                    kprimarytransprnt.withOpacity(0.1)
                                  ])),
                    margin: EdgeInsets.only(left: 1.5.h),
                    // height: 2.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 4.h,
                            width: 4.h,
                            child: Image.asset(cars[index]),
                          ),
                          Text(VehicalTypes[index],
                              style: TextStyle(
                                  color: selectedIndex == index
                                      ? kPrimaryWhite
                                      : kPrimaryGrey,
                                  fontSize: 10.sp)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
