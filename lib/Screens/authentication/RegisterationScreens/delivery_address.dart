import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custom_textFeild.dart';
import '../../Const/colors.dart';
import '../../Home/bottomNavigationBar.dart';

class DeliveryAddress extends StatefulWidget {
  DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController>? _controller;
  final List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      infoWindow: InfoWindow(title: 'my location'),
      markerId: MarkerId('1'),
      position: LatLng(37.42796133580664, -122.085749655962),
    ),
    Marker(
      infoWindow: InfoWindow(title: 'my'),
      markerId: MarkerId('2'),
      position: LatLng(36.42796133580664, -122.085749655962),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _marker.addAll(_list);
    super.initState();
    _controller = Completer();
  }

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
              // physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.topLeft,
                        height: 3.h,
                        width: 3.h,
                        child: Icon(
                          Icons.arrow_back,
                          color: kPrimaryWhite,
                        ),
                      )),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text('Delivery Address',
                          style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 14.sp,
                            fontFamily: 'SFPro',
                          )),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BottomNavigationBarScreen()));
                        },
                        child: Text('Confirm',
                            style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 12.sp,
                              fontFamily: 'SFPro',
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryWhite,
                        borderRadius: BorderRadius.circular(5)),
                    height: 20.h,
                    width: double.infinity,
                    child: GoogleMap(
                      zoomControlsEnabled: false,
                      markers: Set<Marker>.of(_marker),
                      myLocationEnabled: true,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controllor) {
                        // _controller.complete();
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                  customTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter name';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Name',
                      textEditingController: appPro.nameC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 1.h),
                  customTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Email';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Email',
                      textEditingController: appPro.emailC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 1.h),
                  customTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Area';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'select Area',
                      textEditingController: appPro.AreaC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 1.h),
                  customTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Address';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Address Type',
                      textEditingController: appPro.addressTypeC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 46.w,
                          child: customTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Block';
                                } else {
                                  return null;
                                }
                              },
                              hintText: 'Block',
                              textEditingController: appPro.blockC,
                              textInputType: TextInputType.name,
                              error: '',
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 46.w,
                          child: customTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Street';
                                } else {
                                  return null;
                                }
                              },
                              hintText: 'Street',
                              textEditingController: appPro.streetC,
                              textInputType: TextInputType.name,
                              error: '',
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  customTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter Building Name';
                        } else {
                          return null;
                        }
                      },
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
                          width: 46.w,
                          child: customTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Flore';
                                } else {
                                  return null;
                                }
                              },
                              hintText: 'Flore ',
                              textEditingController: appPro.floorC,
                              textInputType: TextInputType.name,
                              error: '',
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 46.w,
                          child: customTextField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter Apartment No';
                                } else {
                                  return null;
                                }
                              },
                              hintText: 'Apartment No',
                              textEditingController: appPro.appartmentC,
                              textInputType: TextInputType.name,
                              error: '',
                              textInputAction: TextInputAction.next),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Container(
                    margin: EdgeInsets.only(left: 1.h),
                    child: Text('Additional Direction (Optional)',
                        style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 12.sp,
                          fontFamily: 'SFPro',
                        )),
                  ),
                  customTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter additional direction';
                        } else {
                          return null;
                        }
                      },
                      hintText: 'Right next to the Walmart building',
                      textEditingController: appPro.aditionalDirectionC,
                      textInputType: TextInputType.name,
                      error: '',
                      textInputAction: TextInputAction.next),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
