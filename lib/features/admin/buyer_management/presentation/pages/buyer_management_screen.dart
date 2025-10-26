import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/search_bar_widget.dart';

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
        leading: SizedBox(),
        actions: [
          Container(
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
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    StatCard(title: "إجمالي المشتريين", value: "24",color:AppColors.primaryColor,),
                    SizedBox(width: 12.w),
                    StatCard(title: "المشتريين المفعلين", value: "24",color: AppColors.primaryColor,),
                    SizedBox(width: 12.w),
                    StatCard(title: "المشتريين غير المفعلين", value: "24",color:AppColors.primaryColor,),
                    SizedBox(width: 12.w),
                    StatCard(title: "المشتريين غير المفعلين", value: "24",color:AppColors.primaryColor,),
                  ],
                ),
              ),
            ),
          ),
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
                   padding: const EdgeInsets.all(12),
                   child: Row(
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                            "قائمه المشترين",
                            style: Theme.of(context).textTheme.bodySmall,
                                           ),
                           SizedBox(height: 4.h),
                           Text(
                             "عرض واداره جميع المشترين المسجلين",
                             style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                 color: AppColors.darkGrey,fontSize: 8.sp
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 8.w,),
                       SearchBarWidget(controller: searchController,onSearch: (query) {
                         if (searchController.text.isNotEmpty) {
                           //context.read<HomeCubit>().getCourses(query: searchController.text,searchCat: searchCategory);
                         }else {
                          // context.read<HomeCubit>().getCourses();
                         }
                       },
                         onClear: () {
                           setState(() {
                             searchController.clear();
                             //context.read<HomeCubit>().getCourses();
                           });
                         },),
                     ],
                   ),
                 ),
                SizedBox(height: 8.h),
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 12,horizontal:8),
                  decoration: BoxDecoration(
                    color: Color(0XFFF9FAFB),
                    borderRadius: BorderRadius.circular(24),border: Border.all(
                    color: Color(0XFFEEFFF8)
                  )
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Text("اسم المشترك", textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 8.sp
                      ))),
                      Expanded(flex: 2, child: Text("رقم الجوال", textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 8.sp
                      ))),
                      Expanded(flex: 2, child: Text("العنوان", textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 8.sp
                      ))),
                      Expanded(flex: 2, child: Text("المنطقة", textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 8.sp
                      ))),
                      Expanded(flex: 1, child: Text("الحالة", textAlign: TextAlign.center,style:Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 8.sp
                      ))),
                    ],
                  ),
                ),
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

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.title, required this.value,required this.color});

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124.w,
      height: 124.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 12,
                child: Icon(Icons.discount_outlined,color: Colors.white,size: 16.sp,),
              ),
            ],
          ),
          SizedBox(height: 4.h,),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
            style:Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 12.sp,
              )
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            width: 73.w,
            height: 27.h,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodySmall
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.hint});
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.search),
        fillColor: const Color(0xFFebf6fc),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class BuyerRow extends StatelessWidget {
  const BuyerRow({super.key, required this.buyer});
  final Buyer buyer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      child: Row(
        children: [
          Expanded(flex: 2, child: Center(child: Text(buyer.name,style:Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 8.sp
          )))),
          Expanded(flex: 2, child: Center(child: Text(buyer.phone,style:Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 8.sp
          )))),
          Expanded(flex: 2, child: Center(child: Text(buyer.address,style:Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 8.sp
          )))),
          Expanded(flex: 2, child: Center(child: Text(buyer.region,style:Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 8.sp
          )))),
          Expanded(
            child: Center(
              child: StatusChip(isActive: buyer.status),
            ),
          ),
        ],
      ),
    );
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isActive ?AppColors.primaryColor.withOpacity(.2) : Colors.red.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: Text(
          isActive ? "نشط" : "غير نشط",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: isActive?AppColors.primaryColor:Colors.red,
            fontSize: 6.sp
          )
        ),
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

