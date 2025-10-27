import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTxt extends StatelessWidget {
  final String txt;
  const TitleTxt({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Text(
          txt,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(fontSize: 8.sp),
        ),
      ),
    );
  }
}
