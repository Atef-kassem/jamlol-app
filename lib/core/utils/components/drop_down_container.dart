import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class DropDownContainer extends StatelessWidget{
  const DropDownContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: MediaQuery.of(context).size.width-60,
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
          Text("عميل/ناقل",style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.darkGrey,
          ),),
          Spacer(),
          Icon(Icons.keyboard_arrow_down,size: 32.sp,color: Colors.black,)
        ],
      ),
    );
  }
}
