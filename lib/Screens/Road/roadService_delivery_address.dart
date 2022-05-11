import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maak_prject/Screens/Home/bottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../AppProviders/appProvider.dart';
import '../../Components/customTextField2.dart';
import '../Const/colors.dart';
import '../Insurence/insuranceMain_screen.dart';

class DeliveryAddressRoadService extends StatefulWidget {
  DeliveryAddressRoadService({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressRoadService> createState() =>
      _DeliveryAddressRoadServiceState();
}

class _DeliveryAddressRoadServiceState
    extends State<DeliveryAddressRoadService> {
  var addressType = '--Address Type--';

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
      return Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            alignment: Alignment.topLeft,
                            height: 4.h,
                            width: 4.h,
                            child: Icon(
                              Icons.arrow_back,
                              color: kPrimaryWhite,
                            ))),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text('Delivery Address',
                            style: TextStyle(
                              color: kPrimaryWhite,
                              fontSize: 16.sp,
                              fontFamily: 'SFPro',
                            )),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        BottomNavigationBarScreen()));
                          },
                          child: Text('Confirm',
                              style: TextStyle(
                                color: kPrimaryWhite,
                                fontSize: 14.sp,
                                fontFamily: 'SFPro',
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: kPrimaryWhite,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h),
                  child: Column(
                    children: [
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Text('Add New Address',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp)),
                              SizedBox(height: 3.h),
                              Row(
                                children: [
                                  Text(addressType,
                                      style: TextStyle(
                                          color: kPrimaryGrey,
                                          fontFamily: 'SFPro',
                                          fontSize: 14.sp)),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 1.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          iconSize: 4.h,

                                          //value: addressType,
                                          items: items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              addressType = newValue!;
                                            });
                                          }),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Select Area',
                                  textEditingController: appPro.AreaC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Block',
                                          textEditingController: appPro.blockC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Street',
                                          textEditingController: appPro.streetC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Avenu',
                                  textEditingController: appPro.buildingNameC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(height: 1.h),
                              customTextField2(
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
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Flore',
                                          textEditingController: appPro.floorC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 48.w,
                                      child: customTextField2(
                                          hintText: 'Additional Direction',
                                          textEditingController:
                                              appPro.aditionalDirectionC,
                                          textInputType: TextInputType.name,
                                          error: '',
                                          textInputAction:
                                              TextInputAction.next),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Landline Number',
                                  textEditingController: appPro.landlinNumberC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      );
    }));
  }
}
