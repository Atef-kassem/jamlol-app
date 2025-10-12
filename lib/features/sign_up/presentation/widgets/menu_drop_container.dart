import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class MenuDropContainer extends StatelessWidget{
  final String txt;
  const MenuDropContainer({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 160.w,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius:BorderRadius.circular(32.r),
          border: Border.all(
              color: AppColors.greyColor
          )
      ),
      child: Row(
        children: [
          Text(txt,style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.darkGrey,fontSize: 12.sp
          ),),
          Spacer(),
          Icon(Icons.keyboard_arrow_down,size: 24.sp,color: Colors.black,)
        ],
      ),
    );
  }
}