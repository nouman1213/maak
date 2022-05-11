import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maak_prject/Screens/Const/colors.dart';
import 'package:maak_prject/Screens/Road/roadService_delivery_address.dart';
import 'package:sizer/sizer.dart';

import '../../Components/custom_button2.dart';

class AddNewAddressRaodService extends StatefulWidget {
  const AddNewAddressRaodService({Key? key}) : super(key: key);

  @override
  State<AddNewAddressRaodService> createState() =>
      _AddNewAddressRaodServiceState();
}

class _AddNewAddressRaodServiceState extends State<AddNewAddressRaodService> {
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 10.h,
            color: kPrimaryWhite,
            child: Container(
              margin: EdgeInsets.only(left: 2.w, top: 1.h),
              child: Row(
                children: [
                  Text(
                    'Near 21 acter scheme, Los Road,...',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'SFPro',
                        color: kPrimaryBlack),
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Search Location',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold,
                          color: kPrimaryOrange),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 63.h,
            width: 100.w,
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
          Expanded(
            child: Container(
              color: kPrimaryWhite,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You Location',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'SFPro',
                          color: kPrimaryBlack),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Hold and Move Pin point your location',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: 'SFPro',
                        color: kPrimaryOrange,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Near 21 acter scheme, Los Road, samanabad Town, Lahore, Punjab 54000,Pakistan',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'SFPro',
                          color: kPrimaryGrey),
                    ),
                    SizedBox(height: 1.5.h),
                    CustomButton2(
                      title: "Continue",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DeliveryAddressRoadService()));
                      },
                      color: kPrimaryOrange,
                      txtStyle:
                          TextStyle(color: kPrimaryWhite, fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
