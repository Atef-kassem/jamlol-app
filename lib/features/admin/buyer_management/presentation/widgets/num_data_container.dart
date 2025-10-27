import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class NumDataContainer extends StatelessWidget{
  const NumDataContainer({super.key, required this.title, required this.value,required this.color});

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 124.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 12,
                child: Icon(Icons.discount_outlined,color: Colors.white,size: 16.sp,),
              ),
            ],
          ),
          SizedBox(height: 4.h,),
          Flexible(
            child: Text(
                title,
                textAlign: TextAlign.center,
                style:Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                )
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: 73.w,
            height: 27.h,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodySmall
              ),
            ),
          ),
        ],
      ),
    );
  }
}