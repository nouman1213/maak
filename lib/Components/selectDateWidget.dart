import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../AppProviders/appProvider.dart';
import '../Screens/Account/select_area.dart';
import '../Screens/Const/colors.dart';
import '../Screens/Const/images.dart';

class selectAreaWidget extends StatefulWidget {
  selectAreaWidget({Key? key}) : super(key: key);

  @override
  State<selectAreaWidget> createState() => _selectAreaWidgetState();
}

class _selectAreaWidgetState extends State<selectAreaWidget> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   GetAreaList();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Text('Select Area',
              style: TextStyle(
                  color: kPrimaryBlack,
                  fontSize: 14.sp,
                  fontFamily: 'SFPro',
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 2.h),
          Container(
            height: 6.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: kPrimaryGrey)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Row(
                children: [
                  Text(appPro.myArea != null ? appPro.myArea! : 'Select Area',
                      style: TextStyle(
                          color: kPrimaryGrey,
                          fontFamily: 'SFPro',
                          fontSize: 12.sp)),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SelectArea()));
                      },
                      icon: Container(
                        height: 2.5.h,
                        width: 2.5.h,
                        child: Image.asset(
                          dropdown,
                          color: kPrimaryGrey,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
