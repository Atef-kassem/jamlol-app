import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetDataFailureWidget extends StatelessWidget{
  final String txt;
  const GetDataFailureWidget({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_rounded,
              color: Colors.red, size: 40.sp),
          SizedBox(height: 12.h),
          Text(
            txt,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
