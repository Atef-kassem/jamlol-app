import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetEmptyDataWidget extends StatelessWidget{
  final String txt;
  const GetEmptyDataWidget({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.book_outlined,
              color: Colors.grey, size: 40.sp),
          SizedBox(height: 12.h),
          Text(
            txt,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );;
  }
}
