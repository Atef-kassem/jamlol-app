import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/status_chip.dart';
import 'package:obour/features/admin/supplier_management/presentation/widgets/title_txt.dart';

class BuyerRow extends StatelessWidget{
  const BuyerRow({super.key, required this.buyer});
  final Buyer buyer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Row(
        children: [
          TitleTxt(txt: buyer.name),
          TitleTxt(txt: buyer.phone),
          TitleTxt(txt: buyer.address),
          TitleTxt(txt: buyer.region),
          Expanded(flex: 2,
            child: Center(
              child: StatusChip(isActive: buyer.status),
            ),
          ),
        ],
      ),
    );
  }
}
class Buyer {
  final String name;
  final String phone;
  final String address;
  final String region;
  final bool status;

  Buyer({
    required this.name,
    required this.phone,
    required this.address,
    required this.region,
    required this.status,
  });
}