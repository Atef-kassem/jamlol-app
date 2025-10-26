import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onClear;
  final ValueChanged<String>? onSearch;

  const SearchBarWidget({required this.controller,
    this.onClear,
    this.onSearch,});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: 40.h,
        child: TextFormField(
          controller: controller,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12.sp
          ),
          onFieldSubmitted: onSearch,
          decoration: InputDecoration(
            hintText: "بحث",
            hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.darkGrey,fontSize: 12.sp
            ),
            contentPadding: EdgeInsets.all(0),
            filled: true,
            fillColor: AppColors.lightGrey,
            prefixIcon: Icon(Icons.search, color: AppColors.darkGrey,size: 16.sp,),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: BorderSide(color:AppColors.greyColor,)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: BorderSide(color: AppColors.greyColor)),
            suffixIcon: InkWell(
                onTap: onClear,
                child: Icon(Icons.clear, color: AppColors.darkGrey,size: 16.sp)),
          ),
        ),
      ),
    );
  }
}