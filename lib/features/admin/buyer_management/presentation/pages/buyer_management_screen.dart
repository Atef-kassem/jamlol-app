import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/buyer_row.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/details_data_row.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/label_search_row.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/table_title_row.dart';
import 'package:obour/features/admin/supplier_management/presentation/pages/supplier_management_screen.dart';

class BuyersManagementScreen extends StatefulWidget {
  const BuyersManagementScreen({super.key});

  @override
  State<BuyersManagementScreen> createState() => _BuyersManagementScreenState();
}

class _BuyersManagementScreenState extends State<BuyersManagementScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<Buyer> buyers = [
      Buyer(name: "احمد عمر", phone: "01029876765", address: "شبين الكوم", region: "المنوفية", status: true),
      Buyer(name: "احمد عمر", phone: "01029876765", address: "شبين الكوم", region: "المنوفية", status: false),
      Buyer(name: "احمد عمر", phone: "01029876765", address: "شبين الكوم", region: "المنوفية", status: true),
      Buyer(name: "احمد عمر", phone: "01029876765", address: "شبين الكوم", region: "المنوفية", status: false),
    ];

    return Scaffold(
      backgroundColor:AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor:AppColors.lightGrey,
        title: Text("اداره المشترين"),
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SupplierManagementScreen(),));
        }, icon:Icon(Icons.next_plan,color: AppColors.darkGrey,)),
        actions: [
          InkWell(
          onTap: () {
    Navigator.pop(context);
    },
            child: Container(
              height: 24,
              width: 24,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor
                ),
                 borderRadius: BorderRadius.circular(8)
              ),
              child: Center(child: Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,size: 18.sp,)),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DetailsDataRow(txt: ["إجمالي المشتريين","المشتريين النشطين","المشتريين غير النشطين"]),
          SizedBox(height: 24.h),
          Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: EdgeInsets.all(12),
                   child: LabelSearchRow(searchController: searchController,),
                 ),
                SizedBox(height: 8.h),
                TableTitleRow(title: ["اسم المشتري","رقم الجوال","العنوان","المنطقة","الحالة"],),
                SizedBox(height: 8.h),
                ...buyers.map((buyer) => BuyerRow(buyer: buyer)).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





