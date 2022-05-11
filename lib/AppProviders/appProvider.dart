import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Screens/Const/images.dart';

class AppProvider extends ChangeNotifier {
  TextEditingController nameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController re_PasswordC = TextEditingController();
  TextEditingController searchC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController numberC = TextEditingController();
  TextEditingController vehicalBrandName = TextEditingController();
  TextEditingController AreaC = TextEditingController();
  TextEditingController blockC = TextEditingController();
  TextEditingController streetC = TextEditingController();
  TextEditingController buildingNameC = TextEditingController();
  TextEditingController floorC = TextEditingController();
  TextEditingController appartmentC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController addressTypeC = TextEditingController();
  TextEditingController aditionalDirectionC = TextEditingController();
  TextEditingController landlinNumberC = TextEditingController();
  TextEditingController couponC = TextEditingController();
  TextEditingController pincodeC = TextEditingController();

  TextEditingController vehicalBrandC = TextEditingController();
  TextEditingController vehicalRegisterationC = TextEditingController();

  clearController() {
    nameC.clear();
    passwordC.clear();
    re_PasswordC.clear();
    emailC.clear();
    numberC.clear();
    passwordC.clear();
    searchC.clear();
    vehicalBrandName.clear();
    AreaC.clear();
    blockC.clear();
    streetC.clear();
    buildingNameC.clear();
    appartmentC.clear();
    floorC.clear();
    titleC.clear();
    addressTypeC.clear();
    aditionalDirectionC.clear();
    landlinNumberC.clear();
    vehicalBrandC.clear();
    couponC.clear();
    vehicalRegisterationC.clear();
  }

  DateTime? formattedDate = DateTime.now();
  bool isLoading = false;

  setLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  setFormatedDate(DateTime dateTime) {
    formattedDate = dateTime;
    notifyListeners();
  }

  String? myArea;
  setArea(String area) {
    myArea = area;
    notifyListeners();
  }

  bool isShow = true;
  bool isVisible = false;
  bool isVisible2 = false;
  isShowPass() {
    isShow = !isShow;
    notifyListeners();
  }

  visibleFalse() {
    isVisible = false;
    notifyListeners();
  }

  visibleTrue() {
    isVisible = true;
    notifyListeners();
  }

  int? _selectedIndex = 0;
  int? get selectedIndex => _selectedIndex;
  setBottomIndex(int? index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int current = 0;
  final CarouselController controller = CarouselController();
  final List<String> imgList = [
    banner1,
    banner2,
    banner3,
    banner1,
  ];
  File? image;
  final _picker = ImagePicker();
  XFile? pickedImage;
  Future getFromCamera(BuildContext context) async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    Navigator.pop(context);
    notifyListeners();
  }
}
