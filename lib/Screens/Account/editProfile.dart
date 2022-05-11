import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../../Components/customTextField2.dart';
import '../../Components/custom_button_gradient.dart';
import '../Const/colors.dart';
import '../Const/images.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var formKey = GlobalKey<FormState>();

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
                        ),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(left: 3.h),
                    child: Text('My Profile',
                        style: TextStyle(
                            color: kPrimaryWhite,
                            fontSize: 16.sp,
                            fontFamily: 'SFPro',
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 2.h),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: GlowingOverscrollIndicator(
                        color: kPrimaryOrange,
                        axisDirection: AxisDirection.down,
                        child: ScrollConfiguration(
                          behavior: ScrollBehavior(),
                          child: ListView(children: [
                            InkWell(
                              onTap: () {
                                imagePickerOption();
                              },
                              child: Row(children: [
                                Container(
                                  child: image == null
                                      ? CircleAvatar(
                                          backgroundColor: kPrimaryWhite,
                                          radius: 60,
                                          child: CircleAvatar(
                                              backgroundColor: kPrimaryWhite,
                                              radius: 30,
                                              backgroundImage:
                                                  AssetImage(camera)),
                                        )
                                      : CircleAvatar(
                                          backgroundColor: kPrimaryWhite,
                                          radius: 50,
                                          backgroundImage: FileImage(image!)),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 4.h),
                                    child: Text('Add photo',
                                        style: TextStyle(
                                          color: kPrimaryGrey,
                                          fontFamily: 'SFPro',
                                          fontSize: 14.sp,
                                        ))),
                              ]),
                            ),
                            SizedBox(height: 5.h),
                            customTextField2(
                                hintText: 'name',
                                textEditingController: appPro.nameC,
                                textInputType: TextInputType.name,
                                error: 'please enter name',
                                textInputAction: TextInputAction.next),
                            SizedBox(height: 2.h),
                            customTextField2(
                                hintText: 'email',
                                textEditingController: appPro.emailC,
                                textInputType: TextInputType.name,
                                error: 'please enter email',
                                textInputAction: TextInputAction.next),
                            SizedBox(height: 2.h),
                            customTextField2(
                                hintText: 'number',
                                textEditingController: appPro.nameC,
                                textInputType: TextInputType.name,
                                error: 'please enter number',
                                textInputAction: TextInputAction.next),
                            SizedBox(height: 8.h),
                            CustomButtonGradient(
                                title: 'Save',
                                onTap: () {},
                                txtStyle: TextStyle(
                                    color: kPrimaryWhite,
                                    fontFamily: 'SFPro',
                                    fontSize: 14.sp)),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      }),
    ));
  }
}
