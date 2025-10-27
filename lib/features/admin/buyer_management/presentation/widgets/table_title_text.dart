import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableTitleText extends StatelessWidget {
  final String txt;
  const TableTitleText({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Text(
        txt,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 8.sp),
      ),
    );
  }
}
