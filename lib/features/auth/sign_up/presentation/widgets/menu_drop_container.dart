import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class MenuDropContainer extends StatefulWidget {
  final String label;
  final List<String> list;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const MenuDropContainer({
    super.key,
    required this.label,
    required this.list,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<MenuDropContainer> createState() => _MenuDropContainerState();
}

class _MenuDropContainerState extends State<MenuDropContainer> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? (widget.list.isNotEmpty ? widget.list.first : null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.5,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
          fillColor: AppColors.lightGrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: AppColors.greyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: AppColors.greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: AppColors.greyColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        dropdownColor: AppColors.lightGrey,
        iconEnabledColor: AppColors.primaryColor,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
        items: widget.list.map((category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
      ),
    );
  }
}
