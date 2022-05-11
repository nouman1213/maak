import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import 'dueckInsuranceCompany.dart';

class FullTabBarScreen extends StatefulWidget {
  FullTabBarScreen({Key? key}) : super(key: key);

  @override
  State<FullTabBarScreen> createState() => _FullTabBarScreenState();
}

bool? fvrt = false;
bool? isbelow5 = false;
bool? isbelow4 = false;
bool? isbelowfour = false;
bool? isRelevance = false;
bool? isAlphabatic = false;
bool? isPricehtl=false;
bool? isPricelth=false;
List screens=[
  DueckInsuranceCompanyScreen(),
  DueckInsuranceCompanyScreen(),
  DueckInsuranceCompanyScreen(),

];
double year = 1;
var range=RangeValues(1, 20);
class _FullTabBarScreenState extends State<FullTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AppProvider>(builder: (context, appPro, child) {
        return SingleChildScrollView(
          child: Container(
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.only(top: 4.h, left: 4.w, right: 4.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          _filterModalBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Image.asset(filterimg),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Filter',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                           
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          _sortModalBottomSheet(context);
                        },
                        child: Row(
                          children: [
                            Image.asset(sortimg),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'Sort By',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: ScrollConfiguration(
                        behavior: ScrollBehavior(),
                        child: GlowingOverscrollIndicator(
                          color: kPrimaryOrange,
                          axisDirection: AxisDirection.down,
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(1.h),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (_) => BookingStatus()));
                                  },
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>screens[index]));
                                    },
                                    child: Container(
                                      height: 16.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kPrimaryGrey),
                                          color: kPrimaryWhite,
                                          borderRadius:
                                              BorderRadius.circular(10),),
                                              
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.h),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 1.h,
                                                    horizontal: 1.5.h),
                                                child: ClipRRect(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: kPrimaryGrey),
                                                      borderRadius: BorderRadius.circular(5)
                                                    ),
                                                    height: 10.h,
                                                    width: 10.h,
                                                    child: Image.asset(
                                                      image1,fit: BoxFit.cover,
                                                      
                                                    ),
                                                  ),
                                                )),
                                            Container(
                                              margin: EdgeInsets.only(top: 3.h),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Matt's Automotive...",
                                                      style: TextStyle(
                                                          color: kPrimaryBlack,
                                                          fontSize: 14.sp)),
                                                          SizedBox(height: 0.8.h,),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 0.5.h),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(star1),
                                                        SizedBox(width: 1.h),
                                                        Text(
                                                            '4.5 - 254 Reviews',
                                                            style: TextStyle(
                                                                color:
                                                                    kPrimaryGrey,
                                                                fontSize:
                                                                    12.sp))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.8.h,),
                                                  Text(
                                                          'Starting Price:  120 KWD',
                                                                style: TextStyle(
                                                                    color:
                                                                        kPrimaryOrange,
                                                                    fontSize:
                                                                        12.sp)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void _filterModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * .43,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Text(
                                'Filters',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'Ratings',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    setSte(() {
                                      isbelow5 = true;
                                      isbelow4 = false;
                                      isbelowfour = false;
                                    });
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      child: isbelow5!
                                          ? Image.asset(radio2_on)
                                          : Image.asset(radio_0),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Below 5',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setSte(() {
                                    isbelow4 = true;
                                    isbelow5 = false;
                                    isbelowfour = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      child: isbelow4!
                                          ? Image.asset(radio2_on)
                                          : Image.asset(radio_0),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Below 4',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setSte(() {
                                    isbelowfour = true;
                                    isbelow5 = false;
                                    isbelow4 = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 3.h,
                                      child: isbelowfour!
                                          ? Image.asset(radio2_on)
                                          : Image.asset(radio_0),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Below 4',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Price Range',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                           SizedBox(
                            height: 2.h,
                          ),
                           Container(
                             width: 100.w,
                             child: SliderTheme(
                               data: SliderTheme.of(context).copyWith(
                                   trackShape: RoundedRectSliderTrackShape(),
                                   valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                                   disabledThumbColor: Colors.transparent,
                                   valueIndicatorTextStyle: TextStyle(
                                     color:kPrimaryWhite,
                                     fontSize: 14.sp
                                   )
                               ),
                               child: Slider(
                                onChanged: (value) {
                                  setState((){
                                    setSte((){
                                      year = value;
                                    });
                                  });
                                },
                                value: year,
                                min: 1,
                                max: 20,
                               label:"${year.floor()} Year",
                                activeColor:kPrimaryOrange,
                                                       divisions: 4,
                                                       ),
                             ),
                           ),
                           SizedBox(height: 2.h,),
                           InkWell(
                             onTap: (){
                               setState(() {
                                 setSte((){
                                   isRelevance=true;
                                   isAlphabatic=false;
                                 });
                               });
                             },
                             child: Row(
                                children: [
                                 Text('Relevance',style: TextStyle(
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 Spacer(),
                                 Container(
                                        height: 3.h,
                                        child: isRelevance!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                             ],),
                           ),
                           SizedBox(height: 2.h,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  setSte((){
                                    isAlphabatic=true;
                                    isRelevance=false;
                                  });
                                });
                              },
                               child: Row(
                               children: [
                                 Text('Alphabetic',style: TextStyle(
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 Spacer(),
                                 Container(
                                        height: 3.h,
                                        child: isAlphabatic!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                                                        ],),
                             )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

   void _sortModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * .35,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                              Text(
                                'Sort',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Apply',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                           InkWell(
                             onTap: (){
                               setState(() {
                                 setSte((){
                                   isRelevance=false;
                                   isPricehtl=true;
                                   isAlphabatic=false;
                                   isPricelth=false;
                                 });
                               });
                             },
                             child: Row(
                                children: [
                                 Text('Price High to Low',style: TextStyle(
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 Spacer(),
                                 Container(
                                        height: 3.h,
                                        child: isPricehtl!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                             ],),
                           ),
                           SizedBox(height: 3.h,),
                            InkWell(
                             onTap: (){
                               setState(() {
                                 setSte((){
                                   isPricelth=true;
                                   isRelevance=false;
                                   isAlphabatic=false;
                                   isPricehtl=false;
                                 });
                               });
                             },
                             child: Row(
                                children: [
                                 Text('Price Low to High',style: TextStyle(
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 Spacer(),
                                 Container(
                                        height: 3.h,
                                        child: isPricelth!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                             ],),
                           ),
                           SizedBox(height: 3.h,),
                           InkWell(
                             onTap: (){
                               setState(() {
                                 setSte((){
                                   isRelevance=true;
                                   isAlphabatic=false;
                                   isPricehtl=false;
                                   isPricelth=false;
                                 });
                               });
                             },
                             child: Row(
                                children: [
                                 Text('Alphabetic',style: TextStyle(
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 Spacer(),
                                 Container(
                                        height: 3.h,
                                        child: isRelevance!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                             ],),
                           ),
                           SizedBox(height: 3.h,),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  setSte((){
                                    isAlphabatic=true;
                                    isRelevance=false;
                                    isPricehtl=false;
                                    isPricelth=false;
                                  });
                                });
                              },
                               child: Row(
                               children: [
                                 Text('Relevance',style: TextStyle(
                                   fontSize: 14.sp,
                                   fontWeight: FontWeight.bold
                                 ),),
                                 Spacer(),
                                 Container(
                                        height: 3.h,
                                        child: isAlphabatic!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                                                        ],),
                             )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
