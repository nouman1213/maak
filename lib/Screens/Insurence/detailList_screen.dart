import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';
import 'uploadCarImagesDetails.dart';

class InsuranceDetaiListSCreen extends StatefulWidget {
  InsuranceDetaiListSCreen({Key? key}) : super(key: key);

  @override
  State<InsuranceDetaiListSCreen> createState() =>
      _InsuranceDetaiListSCreenState();
}

// Generate a list of list items
// In real app, data often is fetched from an API or a database
final List<Map<String, dynamic>> _items = [
  {
    "id": 0,
    "title": "t'azur",
    "price": "26.0 KWD",
    "note": "Duration : 75 Min",
    "content":
        'External wshing with liquid waxing/ interior cleaning car perfuming  garbage bags/ dressing floors and car seat nulon / a tissue box / polishing car tires and wheels / cleanings the air _conditioning vents/polishing the car interior',
  },
  {
    "id": 1,
    "title": "Yalla",
    "price": "89.0 KWD",
    "note": "Duration : 75 Min",
    "content":
        'External wshing with liquid waxing/ interior cleaning car perfuming  garbage bags/ dressing floors and car seat nulon / a tissue box / polishing car tires and wheels / cleanings the air _conditioning vents/polishing the car interior',
  },
  {
    "id": 2,
    "title": "Yalla",
    "price": "236.0 KWD",
    "note": "Duration : 75 Min",
    "content":
        'External wshing with liquid waxing/ interior cleaning car perfuming  garbage bags/ dressing floors and car seat nulon / a tissue box / polishing car tires and wheels / cleanings the air _conditioning vents/polishing the car interior',
  }
];

bool? isAdd = false;
bool? isFvrt = false;
bool onTapPrice = false;
bool isBottomOpen = false;
bool isTost = true;
int? tempIndex;

class _InsuranceDetaiListSCreenState extends State<InsuranceDetaiListSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
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
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 4.h,
                            width: 4.h,
                            child: Icon(
                              Icons.arrow_back,
                              color: kPrimaryWhite,
                            ),
                          )),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              isFvrt = !isFvrt!;
                            });
                          },
                          child: Container(
                              height: 3.h,
                              width: 3.h,
                              child: isFvrt!
                                  ? Image.asset(heratsimg)
                                  : Image.asset(heartoffimg))),
                    ],
                  ),
                ),
                SizedBox(height: 0.h),
                Container(
                  margin: EdgeInsets.only(left: 40.w),
                  child: CircleAvatar(
                    radius: 6.h,
                    backgroundImage: AssetImage(image1),
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("t'azur",
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 14.sp,
                              fontFamily: 'SFPro',
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Image.asset(
                            ratingstarimg,
                            height: 2.h,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '4.5 - 254 Reviews',
                            style: TextStyle(
                                fontFamily: 'SFPro',
                                fontSize: 10.sp,
                                color: kPrimaryWhite),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: kPrimaryWhite,
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                        color: kPrimaryOrange,
                        axisDirection: AxisDirection.down,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.h),
                          child: Column(
                            children: [
                              //SizedBox(height: 3.h),
                              Expanded(
                                child: Container(
                                  width: 100.w,
                                  //color: Colors.red,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: _items.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final item = _items[index];
                                            return ExpansionTile(
                                              onExpansionChanged: (value) {
                                                isBottomOpen = value;
                                                tempIndex = index;
                                                setState(() {});
                                                print(value);
                                              },
                                              collapsedIconColor: kPrimaryGrey,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              childrenPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 1.h,
                                                      horizontal: 2.w),
                                              expandedCrossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              maintainState: true,
                                              title: Row(
                                                children: [
                                                  Text(item['title'],
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontFamily: "SFPro",
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Spacer(),
                                                  Text(item['price'],
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontFamily: "SFPro",
                                                          color:
                                                              Colors.grey[800],
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ],
                                              ),
                                              // contents
                                              children: [
                                                Text(
                                                  'Desription',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: "SFPro",
                                                      color: Colors.grey[800],
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 2.h),
                                                Text(
                                                  item['content'],
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: "SFPro",
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                                SizedBox(height: 2.h),
                                                Text(
                                                  'Note',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontFamily: "SFPro",
                                                      color: Colors.grey[800],
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 2.h),
                                                Text(
                                                  item['note'],
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontFamily: "SFPro",
                                                    color: Colors.grey[800],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 10.h,
                                width: 100.w,
                                color: Colors.grey[200],
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 2.h, right: 3.w, left: 3.w),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (isTost) {
                                              if (isBottomOpen) {
                                                _paymentsummryModalBottomSheet(
                                                    context);
                                              } else {
                                                setState(() {
                                                  isTost = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                      'Please select a service',
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: kPrimaryWhite),
                                                    )))
                                                    .closed
                                                    .then((value) {
                                                  isTost = true;
                                                  setState(() {});
                                                });
                                              }
                                            }
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: kPrimaryGrey),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${tempIndex != null ? _items[tempIndex!]['price'] : '0.0'}',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: kPrimaryGrey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 3.w),
                                                  Icon(Icons.keyboard_arrow_up)
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        UploadCarImagesDetails()));
                                          },
                                          child: Container(
                                            height: 4.5.h,
                                            width: 20.w,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  kprimegradient,
                                                  kPrimaryOrange
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Continue',
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: kPrimaryWhite,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ));
      }),
    ));
  }

  void _paymentsummryModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * .3,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, top: 2.h, right: 6.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Payment Summary',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "SFPro",
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: kPrimaryGrey,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Yalla Super',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: "SFPro",
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${tempIndex != null ? _items[tempIndex!]['price'] : '0.0'} KWD',
                                style: TextStyle(
                                  fontFamily: "SFPro",
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Text(
                                'Payable Amount',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "SFPro",
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '${tempIndex != null ? _items[tempIndex!]['price'] : '0.0'} KWD',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "SFPro",
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            height: 10.h,
                            width: 100.w,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 2.h, right: 3.w, left: 3.w),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: "SFPro",
                                              color: kPrimaryGrey),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          '${tempIndex != null ? _items[tempIndex!]['price'] : '0.0'} KWD',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: kPrimaryGrey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 4.5.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              kprimegradient,
                                              kPrimaryOrange
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Check Out',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: kPrimaryWhite,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
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
