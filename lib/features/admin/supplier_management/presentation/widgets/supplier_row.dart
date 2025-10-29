import 'package:flutter/material.dart';
import 'package:obour/features/admin/supplier_management/domain/entities/get_all_suppliers_entity.dart';
import 'package:obour/features/admin/supplier_management/presentation/pages/supplier_management_screen.dart';
import 'package:obour/features/admin/supplier_management/presentation/widgets/title_txt.dart';

class SupplierRow extends StatelessWidget{
  final SupplierEntity supplier;
  const SupplierRow({super.key,required this.supplier});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Row(
        children: [
          TitleTxt(txt: supplier.name??""),
          TitleTxt(txt: supplier.jwal??""),
          TitleTxt(txt: supplier.supplierType??""),
          TitleTxt(txt: supplier.identificationNumber??""),
          TitleTxt(txt: supplier.address??""),
        ],
      ),
    );
  }
}
