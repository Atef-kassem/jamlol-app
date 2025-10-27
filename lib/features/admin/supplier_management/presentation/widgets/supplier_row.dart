import 'package:flutter/material.dart';
import 'package:obour/features/admin/supplier_management/presentation/pages/supplier_management_screen.dart';
import 'package:obour/features/admin/supplier_management/presentation/widgets/title_txt.dart';

class SupplierRow extends StatelessWidget{
  final Supplier supplier;
  const SupplierRow({super.key,required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Row(
        children: [
          TitleTxt(txt: supplier.name),
          TitleTxt(txt: supplier.phone),
          TitleTxt(txt: supplier.type),
          TitleTxt(txt: supplier.idNum),
          TitleTxt(txt: supplier.address),
        ],
      ),
    );
  }
}
