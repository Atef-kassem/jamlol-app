import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/features/admin/buyer_management/domain/entities/get_all_buyers_entity.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/status_chip.dart';
import 'package:obour/features/admin/supplier_management/presentation/widgets/title_txt.dart';

class BuyerRow extends StatelessWidget{
  const BuyerRow({super.key, required this.buyer});
  final GetAllBuyersClientsEntity buyer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Row(
        children: [
          TitleTxt(txt: buyer.name??""),
          TitleTxt(txt: buyer.jwal??""),
          TitleTxt(txt: buyer.address??""),
          TitleTxt(txt: buyer.region?.name??""),
          Expanded(flex: 2,
            child: Center(
              child: StatusChip(isActive: buyer.active=="active"),
            ),
          ),
        ],
      ),
    );
  }
}
