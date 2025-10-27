import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/num_data_container.dart';

class DetailsDataRow extends StatelessWidget{
 final List<String> txt;
  const DetailsDataRow({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: txt
                .map(
                  (title) => Padding(
                padding: EdgeInsets.only(right: 12),
                child: NumDataContainer(
                  title: title,
                  value: "24",
                  color: AppColors.primaryColor,
                ),
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
