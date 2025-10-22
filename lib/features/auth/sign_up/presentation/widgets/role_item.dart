import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class RoleItem extends StatelessWidget{
  final String img;
  final String txt;
  Color color;
  RoleItem({super.key,required this.img,required this.txt,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 130.h,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        border:Border.all(
          color: AppColors.primaryColor
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24.r)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(img,width: 64.w,height: 50.h,color: (color==AppColors.primaryColor)?Colors.white:AppColors.primaryColor,),
              SizedBox(height:12.h),
              Text(txt, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.sp,
                color: (color==AppColors.primaryColor)?Colors.white:Colors.black
              ))

            ],
          ),
        ),
      ),
    );
  }
}
