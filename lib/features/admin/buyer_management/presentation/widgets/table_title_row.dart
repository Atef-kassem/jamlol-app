import 'package:flutter/material.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/table_title_text.dart';

class TableTitleRow extends StatelessWidget {
 final List<String>title;
  const TableTitleRow({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Color(0XFFF9FAFB),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0XFFEEFFF8)),
      ),
      child: Row(
        children:
          title
          .map(
          (txt) =>TableTitleText(txt: txt, )).toList(),
      ),
    );
  }
}
