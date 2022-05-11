import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> messages = [
    {
      "from": "him",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg": "Lorem ipsum dolor sit amet, consectetur",
      "time": "3:55pm",
      "read": false
    },
    {
      "from": "him",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": false
    },
    {
      "from": "me",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    child: Text('Live Chat',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior(),
                      child: GlowingOverscrollIndicator(
                          color: kPrimaryOrange,
                          axisDirection: AxisDirection.down,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(top: size.height * 0.0),
                                // height: size.height*0.8,
                                width: size.width,
                                // decoration: BoxDecoration(
                                //     color: Colors.white,
                                //     ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      right: size.width * 0.00,
                                      top: size.height * 0.00),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: ListView.builder(
                                        itemCount: messages.length,
                                        itemBuilder: (context, index) {
                                          return messages[index]["from"] == "me"
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        // messages[index]["read"]
                                                        //     ? SvgPicture.asset(downloading_icon,color: Colors.black,)
                                                        //     : SizedBox(),
                                                        Column(
                                                          children: [
                                                            Container(
                                                                // alignment: messages[index]["from"]=="him"?Alignment.topLeft:Alignment.topRight,
                                                                margin: EdgeInsets.only(
                                                                    bottom: size
                                                                            .height *
                                                                        .02),
                                                                padding: EdgeInsets.only(
                                                                    left:
                                                                        size.height *
                                                                            .02,
                                                                    top: size.height *
                                                                        .02,
                                                                    right: size
                                                                            .height *
                                                                        .02,
                                                                    bottom: size
                                                                            .height *
                                                                        .02),
                                                                // height: size.height * .17,
                                                                width: size
                                                                        .height *
                                                                    .3,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: messages[index]
                                                                              [
                                                                              "from"] ==
                                                                          "him"
                                                                      ? Colors
                                                                          .grey
                                                                      : kPrimaryOrange,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: messages[index]["from"] ==
                                                                            "him"
                                                                        ? Radius.circular(
                                                                            size.height *
                                                                                .0)
                                                                        : Radius.circular(size.height *
                                                                            .02),
                                                                    topRight: messages[index]["from"] ==
                                                                            "him"
                                                                        ? Radius.circular(size.height *
                                                                            .02)
                                                                        : Radius.circular(size.height *
                                                                            .0),
                                                                    bottomLeft: Radius.circular(
                                                                        size.height *
                                                                            .02),
                                                                    bottomRight:
                                                                        Radius.circular(size.height *
                                                                            .02),
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisAlignment: messages[index]
                                                                              [
                                                                              "from"] ==
                                                                          "him"
                                                                      ? MainAxisAlignment
                                                                          .start
                                                                      : MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      messages[
                                                                              index]
                                                                          [
                                                                          "msg"],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .normal,
                                                                          fontSize:
                                                                              size.height * .020),
                                                                    ),
                                                                  ],
                                                                )),
                                                            // Text(
                                                            //   "3:55pm",
                                                            //   style: TextStyle(
                                                            //       fontFamily: "Stf",
                                                            //       color: infocolor),
                                                            // ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Container(
                                                          child: CircleAvatar(
                                                            radius: 3.h,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    profileImage),
                                                          ),
                                                          margin: EdgeInsets.only(
                                                              bottom:
                                                                  size.height *
                                                                      0.08),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    Container(
                                                      child: CircleAvatar(
                                                        radius: 3.h,
                                                        backgroundImage:
                                                            AssetImage(
                                                                profileImage),
                                                      ),
                                                      margin: EdgeInsets.only(
                                                          bottom: size.height *
                                                              0.10),
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.04,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                            // alignment: messages[index]["from"]=="him"?Alignment.topLeft:Alignment.topRight,
                                                            margin: EdgeInsets.only(
                                                                bottom:
                                                                    size.height *
                                                                        .02),
                                                            padding: EdgeInsets.only(
                                                                left:
                                                                    size.height *
                                                                        .02,
                                                                top:
                                                                    size.height *
                                                                        .02,
                                                                right: size
                                                                        .height *
                                                                    .02,
                                                                bottom: size
                                                                        .height *
                                                                    .02),
                                                            // height: size.height * .17,
                                                            width:
                                                                size.height *
                                                                    .3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: messages[index]
                                                                          [
                                                                          "from"] ==
                                                                      "him"
                                                                  ? Color.fromRGBO(224, 224, 224, 1)
                                                                  : kPrimaryOrange,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: messages[index]
                                                                            [
                                                                            "from"] ==
                                                                        "him"
                                                                    ? Radius.circular(
                                                                        size.height *
                                                                            .0)
                                                                    : Radius.circular(
                                                                        size.height *
                                                                            .02),
                                                                topRight: messages[index]
                                                                            [
                                                                            "from"] ==
                                                                        "him"
                                                                    ? Radius.circular(
                                                                        size.height *
                                                                            .02)
                                                                    : Radius.circular(
                                                                        size.height *
                                                                            .0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        size.height *
                                                                            .02),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        size.height *
                                                                            .02),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  messages[index]
                                                                              [
                                                                              "from"] ==
                                                                          "him"
                                                                      ? MainAxisAlignment
                                                                          .start
                                                                      : MainAxisAlignment
                                                                          .end,
                                                              children: [
                                                                Text(
                                                                  messages[
                                                                          index]
                                                                      ["msg"],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          size.height *
                                                                              .020),
                                                                ),
                                                              ],
                                                            )),
                                                        // Text(
                                                        //   "3:55pm",
                                                        //   style: TextStyle(
                                                        //       fontFamily: "Stf",
                                                        //       ),
                                                        // ),
                                                      ],
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                    ),
                                                  ],
                                                );
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Container(
                                margin: EdgeInsets.only(bottom: 0.0.h),
                                height: 7.h,
                                width: 95.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: 7.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            color: kPrimaryWhite,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              hintText: 'Aa',
                                              contentPadding:
                                                  EdgeInsets.all(15)),
                                        )),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(emogi)),
                                    InkWell(
                                        onTap: () {
                                          appPro.getFromCamera(context);
                                        },
                                        child: Image.asset(smallCamera)),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                          margin: EdgeInsets.only(right: 2.h),
                                          child: Image.asset(mic)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ));
      }),
    ));
  }
}
