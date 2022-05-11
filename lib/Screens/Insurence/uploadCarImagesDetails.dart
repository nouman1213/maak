import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maak_prject/Screens/Insurence/selectPaymentOption.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../../Components/customTextField2.dart';
import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class UploadCarImagesDetails extends StatefulWidget {
  UploadCarImagesDetails({Key? key}) : super(key: key);

  @override
  State<UploadCarImagesDetails> createState() => _UploadCarImagesDetailsState();
}

bool? isAgree = false;
String? _isTerm;

class _UploadCarImagesDetailsState extends State<UploadCarImagesDetails> {
  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 35.h,
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Pic Image From",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'SFPro',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryOrange)),
                    onPressed: () {
                      getFromCamera(context);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text(
                      "CAMERA",
                      style: TextStyle(
                        fontFamily: 'SFPro',
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryOrange)),
                    onPressed: () {
                      getFromGallery(context);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text(
                      "GALLERY",
                      style: TextStyle(
                        fontFamily: 'SFPro',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryOrange)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    label: const Text(
                      "CANCEL",
                      style: TextStyle(
                        fontFamily: 'SFPro',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Get from gallery
  File? image;
  final _picker = ImagePicker();
  XFile? pickedImage;
  Future getFromGallery(BuildContext context) async {
    pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage!.path);
    }

    Navigator.pop(context);
    setState(() {});
  }

  /// Get from Camera
  Future getFromCamera(BuildContext context) async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppProvider>(builder: (context, appPro, _) {
      return Container(
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
              SizedBox(height: 3.h),
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
                      ),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(left: 3.h),
                  child: Text('Enter Details',
                      style: TextStyle(
                          color: kPrimaryWhite,
                          fontSize: 16.sp,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 2.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.grey[100],
                    child: Column(
                      children: [
                        SizedBox(height: 4.h),
                        Padding(
                          padding: EdgeInsets.only(left: 3.w, right: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Upload Car Images',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      imagePickerOption();
                                    },
                                    child: Container(
                                      height: 10.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: kPrimaryOrange, width: 3),
                                          color: kPrimaryGrey.withOpacity(0.3)),
                                      child: Image.asset(
                                        camera,
                                        color: kPrimaryOrange,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: kPrimaryOrange, width: 3),
                                        color: kPrimaryGrey.withOpacity(0.3)),
                                    child: Image.asset(
                                      camera,
                                      color: kPrimaryOrange,
                                    ),
                                  ),
                                  Container(
                                    height: 10.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: kPrimaryOrange, width: 3),
                                        color: kPrimaryGrey.withOpacity(0.3)),
                                    child: Image.asset(
                                      camera,
                                      color: kPrimaryOrange,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      imagePickerOption();
                                    },
                                    child: Container(
                                      height: 10.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: kPrimaryOrange, width: 3),
                                          color: kPrimaryGrey.withOpacity(0.3)),
                                      child: Image.asset(
                                        camera,
                                        color: kPrimaryOrange,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 10.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: kPrimaryOrange, width: 3),
                                        color: kPrimaryGrey.withOpacity(0.3)),
                                    child: Image.asset(
                                      camera,
                                      color: kPrimaryOrange,
                                    ),
                                  ),
                                  Container(
                                    height: 10.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: kPrimaryOrange, width: 3),
                                        color: kPrimaryGrey.withOpacity(0.3)),
                                    child: Image.asset(
                                      camera,
                                      color: kPrimaryOrange,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    'Imortant - Photos should be from all sides of the car (Right, Left, Back, Front side and frontglass photo)',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: 'SFPro',
                                        color: kPrimaryGrey),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text('Add Car Details',
                                  style: TextStyle(
                                      color: kPrimaryBlack,
                                      fontFamily: 'SFPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp)),
                              SizedBox(height: 1.h),
                              InkWell(
                                // onTap: () {
                                //   setState(() {
                                //     showDialogBox(context);
                                //   });
                                // },
                                child: Row(
                                  children: [
                                    Text(
                                      'Insurance Start date',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'SFPro',
                                          color: kPrimaryGrey),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      calendar,
                                      height: 3.h,
                                      width: 3.h,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Insrance Type',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'SFPro',
                                    color: kPrimaryGrey),
                              ),
                              SizedBox(height: 1.h),
                              customTextField2(
                                  hintText: 'Mobile Number',
                                  textEditingController: appPro.vehicalBrandC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {
                                  imagePickerOption();
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Civil id (Front)',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'SFPro',
                                          color: kPrimaryGrey),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      addgreyimg,
                                      height: 3.h,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Divider(),
                              SizedBox(
                                height: 2.h,
                              ),
                              InkWell(
                                onTap: () {
                                  imagePickerOption();
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Civil id (back)',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily: 'SFPro',
                                          color: kPrimaryGrey),
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      addgreyimg,
                                      height: 3.h,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Divider(),
                              SizedBox(
                                height: 2.h,
                              ),
                              customTextField2(
                                  hintText: 'Car Respiration Number',
                                  textEditingController: appPro.vehicalBrandC,
                                  textInputType: TextInputType.name,
                                  error: '',
                                  textInputAction: TextInputAction.next),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: kPrimaryOrange,
                                    side: BorderSide(
                                        color: kPrimaryOrange, width: 2),
                                    value: isAgree,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isAgree = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Iagree to this term, Insurance will start covering \nonce we deliver the insurance policy and take the \nimages of the car',
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'SFPro',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: 'Stripe',
                                    groupValue: _isTerm,
                                    onChanged: (dynamic newValue) =>
                                        setState(() => _isTerm = newValue),
                                    activeColor: kPrimaryOrange,

                                    // selected: false,
                                  ),
                                  Text(
                                    "I Agree Term's and Conditions",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      fontFamily: 'SFPro',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              CustomButtonGradient(
                                  title: 'Save',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SelectPaymentOptionScreen()));
                                  },
                                  txtStyle: TextStyle(
                                      color: kPrimaryWhite, fontSize: 14.sp)),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ));
    }));
  }

  // ++++++++ Show Dialog Function ++++++++ //
  Future<dynamic> showDialogBox(BuildContext context) async {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: Divider.createBorderSide(context),
    );

    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setStates) {
            return Consumer<AppProvider>(builder: (context, appPro, child) {
              return SingleChildScrollView(
                child: Dialog(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20.0)), //this right here
                  child: SizedBox(
                    // height: 80.h,
                    width: double.infinity,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: TextFormField(
                            controller: appPro.nameC,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ' please enter title';
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Title',
                              border: inputBorder,
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                              filled: true,
                              contentPadding: EdgeInsets.only(left: 6.w),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.h),
                          child: SizedBox(
                            height: 5.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    height: 15.h,
                                    width: 15.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          color: kPrimaryWhite,
                                          fontFamily: 'museo',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {},
                                  child: Container(
                                    height: 15.h,
                                    width: 15.h,
                                    decoration: BoxDecoration(
                                      color: kPrimaryOrange,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Add",
                                        style: TextStyle(
                                          color: kPrimaryWhite,
                                          fontFamily: 'museo',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          });
        });
  }
}
