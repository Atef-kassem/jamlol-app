import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class UploadImageField extends StatelessWidget{
  const UploadImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius:BorderRadius.circular(32.r),
          border: Border.all(
              color: AppColors.greyColor
          )
      ),
      child: Row(
        children: [
          Text("تحميل صورة",style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.darkGrey,
            fontSize: 12.sp
          ),),
          Spacer(),
          Icon(Icons.file_upload_outlined,size: 24.sp,color: AppColors.primaryColor,)
        ],
      ),
    );
  }
}
