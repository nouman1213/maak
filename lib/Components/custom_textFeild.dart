import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../AppProviders/appProvider.dart';
import '../Screens/Const/colors.dart';

class customTextField extends StatelessWidget {
  final String? error;
  final TextEditingController textEditingController;
  final bool isPass;
  final bool isShow;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function()? onTapIcon;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;

  customTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.isPass = false,
    this.isShow = false,
    this.onTapIcon,
    this.onChanged,
    required this.validator,
    required this.textInputType,
    this.error,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Padding(
        padding: EdgeInsets.all(1.h),
        child: Container(
          child: TextFormField(
            controller: textEditingController,
            onChanged: onChanged,
            validator: validator,
            keyboardType: textInputType,
            obscureText: isShow,
            textInputAction: textInputAction,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: kPrimaryWhite),
              suffixIcon: isPass
                  ? InkWell(
                      onTap: onTapIcon,
                      child: Icon(
                        isShow ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryWhite,
                      ))
                  : null,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryWhite),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: kPrimaryWhite),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryWhite),
              ),
            ),
          ),
        ),
      );
    });
  }
}
