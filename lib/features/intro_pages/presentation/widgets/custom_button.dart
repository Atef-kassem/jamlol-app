import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget{
  final String txt;
  const CustomButton({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 320.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(32.r),
      ),
      child: Center(
        child: Text(txt,style:Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Colors.white,fontWeight: FontWeight.w700
        )),
      ),
    );

  }
}
