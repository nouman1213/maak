import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../../Components/custonButtonWite.dart';
import '../../Const/colors.dart';
import 'delivery_address.dart';

class GoogleMapScreen extends StatefulWidget {
  GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
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
    return Scaffold(body: SingleChildScrollView(
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Container(
                      child: Text('Welcome John!',
                          style: TextStyle(
                              color: kPrimaryWhite,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'SFPro',
                              fontSize: 16.sp))),
                  SizedBox(height: 2.h),
                  Text('Just one more thing !!',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontFamily: 'SFPro',
                          fontSize: 12.sp)),
                  SizedBox(height: 2.h),
                  Container(
                    decoration: BoxDecoration(
                        color: kPrimaryWhite,
                        // image: DecorationImage(
                        //     fit: BoxFit.cover, image: AssetImage(capture)),
                        borderRadius: BorderRadius.circular(5)),
                    height: 65.h,
                    child: Stack(
                      children: [
                        GoogleMap(
                          markers: Set<Marker>.of(_marker),
                          myLocationEnabled: true,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (GoogleMapController controllor) {
                            // _controller!.complete();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 3.h),
                          child: Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                                color: kPrimaryWhite,
                                borderRadius: BorderRadius.circular(50)),
                            child: InkWell(
                                onTap: () {},
                                child: TextFormField(
                                  controller: appPro.addressTypeC,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Add Address',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 2.h),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text('Skip',
                            style: TextStyle(
                                color: kPrimaryWhite,
                                fontFamily: 'SFPro',
                                fontSize: 14.sp)),
                      ),
                      Spacer(),
                      customButtonWhite(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DeliveryAddress()));
                        },
                        title: 'Next',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ));
  }
}
