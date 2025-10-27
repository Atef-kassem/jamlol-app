import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/search_bar_widget.dart';

class SupplierLabelSearchRow extends StatefulWidget{
 final TextEditingController searchController;
  const SupplierLabelSearchRow({super.key,required this.searchController});

  @override
  State<SupplierLabelSearchRow> createState() => _SupplierLabelSearchRowState();
}

class _SupplierLabelSearchRowState extends State<SupplierLabelSearchRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "قائمه الموردين",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 4.h),
            Text(
              "عرض واداره جميع الموردين المسجلين",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.darkGrey,fontSize: 8.sp
              ),
            ),
          ],
        ),
        SizedBox(width: 12.w,),
        SearchBarWidget(controller: widget.searchController,onSearch: (query) {
          if (widget.searchController.text.isNotEmpty) {
            //context.read<HomeCubit>().getCourses(query: searchController.text,searchCat: searchCategory);
          }else {
            // context.read<HomeCubit>().getCourses();
          }
        },
          onClear: () {
            setState(() {
              widget.searchController.clear();
              //context.read<HomeCubit>().getCourses();
            });
          },),
      ],
    );
  }
}
