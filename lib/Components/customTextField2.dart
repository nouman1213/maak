import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../AppProviders/appProvider.dart';
import '../Screens/Const/colors.dart';

class customTextField2 extends StatelessWidget {
  final String error;
  final TextEditingController textEditingController;
  final bool isPass;
  final bool isShow;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function()? onTapIcon;
  final Function(String?)? onChanged;

  customTextField2({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.isPass = false,
    this.isShow = false,
    this.onTapIcon,
    this.onChanged,
    required this.textInputType,
    required this.error,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Padding(
        padding: EdgeInsets.all(1.h),
        child: Container(
          child: TextFormField(
            onChanged: onChanged,
            validator: (value) {
              if (value!.isEmpty) {
                return error;
              }
              return null;
            },
            keyboardType: textInputType,
            obscureText: isShow,
            textInputAction: textInputAction,
            style: const TextStyle(color: kPrimaryBlack),
            decoration: InputDecoration(
              suffixIcon: isPass
                  ? InkWell(
                      onTap: onTapIcon,
                      child: Icon(
                        isShow ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryWhite,
                      ))
                  : null,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryGrey),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: kPrimaryGrey),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryGrey),
              ),
            ),
          ),
        ),
      );
    });
  }
}
