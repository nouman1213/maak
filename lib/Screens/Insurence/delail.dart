import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import 'detailList_screen.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool? fvrt = false;
  bool? isbelow5 = false;
  bool? isbelow4 = false;
  bool? isbelowfour = false;
  bool? isRelevance = false;
  bool? isAlphabatic = false;
  bool? isPricehtl = false;
  bool? isPricelth = false;

  double year = 1;
  RangeValues _currentRangeValues = const RangeValues(1, 55);
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
                                color: kPrimaryGrey,
                                fontFamily: 'SFPro',
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
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
                                color: kPrimaryGrey,
                                fontFamily: 'SFPro',
                                fontSize: 14.sp,
                              ),
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
                            itemCount: 10,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(1.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                InsuranceDetaiListSCreen()));
                                  },
                                  child: Container(
                                    height: 13.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kPrimaryGrey),
                                        color: kPrimaryWhite,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0.h),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h,
                                                  horizontal: 1.5.h),
                                              child: Container(
                                                height: 10.h,
                                                width: 10.h,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: kPrimaryGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Image.asset(
                                                  image1,
                                                  fit: BoxFit.cover,
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
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 0.5.h),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(star1),
                                                      SizedBox(width: 1.h),
                                                      Text('4.5 - 254 Reviews',
                                                          style: TextStyle(
                                                              color:
                                                                  kPrimaryGrey,
                                                              fontSize: 12.sp))
                                                    ],
                                                  ),
                                                ),
                                                Text('Starting Price : 5 KWD',
                                                    style: TextStyle(
                                                        color: kPrimaryOrange,
                                                        fontFamily: 'SFPro',
                                                        fontSize: 10.sp))
                                              ],
                                            ),
                                          ),
                                        ],
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
                          left: size.width * 0.00,
                          right: size.width * 0.00,
                          top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5.h,
                            color: Colors.orange,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 12.sp, fontFamily: "SFPro"),
                                    ),
                                  ),
                                  Text(
                                    'Filters',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: "SFPro",
                                        fontWeight: FontWeight.bold),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(
                                          fontSize: 12.sp, fontFamily: "SFPro"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.h),
                            child: Text(
                              'Rating',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.sp,
                                  fontFamily: 'SFPro',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 5.h,
                            color: Colors.orange,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                              ? Image.asset(radio2_on,
                                                  color: kPrimaryWhite)
                                              : Image.asset(radio_0,
                                                  color: kPrimaryWhite),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          'Below 2',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'SFPro'),
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
                                              ? Image.asset(radio2_on,
                                                  color: kPrimaryWhite)
                                              : Image.asset(radio_0,
                                                  color: kPrimaryWhite),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          'Below 4',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'SFPro'),
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
                                              ? Image.asset(radio2_on,
                                                  color: kPrimaryWhite)
                                              : Image.asset(radio_0,
                                                  color: kPrimaryWhite),
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          'Below 6',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: 'SFPro'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.h),
                            child: Text(
                              'Price Range',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontFamily: 'SFPro',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Text('1.0 KWD',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: 'SFPro',
                                          fontSize: 12.sp))),
                              Spacer(),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Text('55.0 KWD',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontFamily: 'SFPro',
                                          fontSize: 12.sp))),
                            ],
                          ),
                          Container(
                              width: 100.w,
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    trackShape: RoundedRectSliderTrackShape(),
                                    valueIndicatorShape:
                                        PaddleSliderValueIndicatorShape(),
                                    disabledThumbColor: Colors.transparent,
                                    valueIndicatorTextStyle: TextStyle(
                                        color: kPrimaryWhite, fontSize: 12.sp)),
                                child: RangeSlider(
                                  inactiveColor: kPrimaryOrange,
                                  activeColor: kPrimaryOrange,
                                  values: _currentRangeValues,
                                  max: 100,
                                  divisions: 100,
                                  labels: RangeLabels(
                                    _currentRangeValues.start
                                        .round()
                                        .toString(),
                                    _currentRangeValues.end.round().toString(),
                                  ),
                                  onChanged: (RangeValues values) {
                                    setState(() {
                                      setSte(() {
                                        _currentRangeValues = values;
                                      });
                                    });
                                  },
                                ),
                              )),
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.h),
                            child: Row(
                              children: [
                                Text('1.0 KWD',
                                    style: TextStyle(
                                        color: kPrimaryBlack,
                                        fontFamily: 'SFPro',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                                Spacer(),
                                Text('55.0 KWD',
                                    style: TextStyle(
                                        color: kPrimaryBlack,
                                        fontFamily: 'SFPro',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
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
                          left: size.width * 0.00,
                          right: size.width * 0.00,
                          top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5.h,
                            color: Colors.orange,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.h),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 4.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      setSte(() {
                                        isRelevance = false;
                                        isPricehtl = true;
                                        isAlphabatic = false;
                                        isPricelth = false;
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 3.h,
                                        child: isPricehtl!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                                      SizedBox(width: 5.h),
                                      Text(
                                        'Price High to Low',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kPrimaryBlack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      setSte(() {
                                        isPricelth = true;
                                        isRelevance = false;
                                        isAlphabatic = false;
                                        isPricehtl = false;
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 3.h,
                                        child: isPricelth!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                                      SizedBox(width: 5.h),
                                      Text(
                                        'Price Low to High',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kPrimaryBlack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      setSte(() {
                                        isRelevance = true;
                                        isAlphabatic = false;
                                        isPricehtl = false;
                                        isPricelth = false;
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 3.h,
                                        child: isRelevance!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                                      SizedBox(width: 5.h),
                                      Text(
                                        'Alphabetic',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kPrimaryBlack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      setSte(() {
                                        isAlphabatic = true;
                                        isRelevance = false;
                                        isPricehtl = false;
                                        isPricelth = false;
                                      });
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 3.h,
                                        child: isAlphabatic!
                                            ? Image.asset(radio2_on)
                                            : Image.asset(radio_0),
                                      ),
                                      SizedBox(width: 5.h),
                                      Text(
                                        'Relevance',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: kPrimaryBlack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
