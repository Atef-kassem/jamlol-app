

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class TextFieldItem extends StatelessWidget{
  TextEditingController controller = TextEditingController();
  String hint;
  IconData icon;
  String validateTxt;

  TextFieldItem(
      {required this.controller,
        required this.hint,
        required this.icon,
        required this.validateTxt});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.darkGrey,fontSize: 12.sp
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),

        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.darkGrey,fontSize: 12.sp
        ),
        filled: true,
        fillColor: AppColors.lightGrey,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(color: AppColors.greyColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(color:AppColors.greyColor)),
        prefixIcon:Icon(icon,size: 20.sp,color: AppColors.primaryColor,)
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validateTxt;
        }
        return null;
      },
    );
  }
}