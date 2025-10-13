import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class PasswordInputField extends StatefulWidget{
  TextEditingController controller = TextEditingController();


  PasswordInputField({super.key,required this.controller,});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool secure=false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.darkGrey,fontSize: 12.sp
      ),
      controller: widget.controller,
      obscureText: secure ? true : false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        filled: true,
        fillColor: AppColors.lightGrey,
        hintText: "كلمه المرور",
        hintStyle:Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.darkGrey,fontSize: 12.sp
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(30.r),
            borderSide: BorderSide(
                color:AppColors.greyColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(30.r),
            borderSide: BorderSide(
                color: AppColors.greyColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.r),
            borderSide: BorderSide(color:Colors.red)),
        suffixIcon: IconButton(
          onPressed: () {
            secure = !secure;
            setState(() {});
          },
          icon: secure
              ? Icon(Icons.visibility_off,
              color: AppColors.primaryColor,size: 20.sp)
              : Icon(
            Icons.visibility,
            color:AppColors.primaryColor,
            size: 24.sp,
          ),
        ),
        prefixIcon: Icon(Icons.lock,
          color: AppColors.primaryColor,size: 20.sp,),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your password";
        }
        return null;
      },
    );
  }
}
