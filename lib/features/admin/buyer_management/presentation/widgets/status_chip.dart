import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class StatusChip extends StatelessWidget{
  const StatusChip({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 56.w,
      decoration: BoxDecoration(
        color: isActive ?AppColors.primaryColor.withOpacity(.2) : Colors.red.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
            isActive ? "نشط" : "غير نشط",
            //textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isActive?AppColors.primaryColor:Colors.red,
                fontSize: 7.sp
            )
        ),
      ),
    );
  }
}