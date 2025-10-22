import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class MenuDropContainer<T> extends StatefulWidget {
  final String label;
  final List<T> list;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final String Function(T) itemLabel;

  const MenuDropContainer({
    super.key,
    required this.label,
    required this.list,
    required this.itemLabel,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<MenuDropContainer<T>> createState() => _MenuDropContainerState<T>();
}

class _MenuDropContainerState<T> extends State<MenuDropContainer<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null &&
        widget.list.contains(widget.initialValue)) {
      selectedValue = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: selectedValue,
      hint: Text(
        widget.label,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 12.sp,
          color: AppColors.darkGrey,
        ),
      ),
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        fontSize: 12.sp,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.primaryColor,
      ),
      dropdownColor: AppColors.lightGrey,
      decoration: InputDecoration(
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
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      validator: (value) =>
      value == null ? 'Please select ${widget.label}' : null,
      items: widget.list.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(widget.itemLabel(item)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => selectedValue = value);
        widget.onChanged?.call(value);
      },
    );
  }
}



