import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/get_data_failure_widget.dart';
import 'package:obour/core/utils/components/get_empty_data_widget.dart';
import 'package:obour/core/utils/components/loading_widget.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/buyer_row.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/details_data_row.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/label_search_row.dart';
import 'package:obour/features/admin/buyer_management/presentation/widgets/table_title_row.dart';
import 'package:obour/features/admin/supplier_management/presentation/manager/get_suppliers/get_suppliers_cubit.dart';
import 'package:obour/features/admin/supplier_management/presentation/widgets/supplier_label_search_row.dart';
import 'package:obour/features/admin/supplier_management/presentation/widgets/supplier_row.dart';

class SupplierManagementScreen extends StatefulWidget{
  const SupplierManagementScreen({super.key});

  @override
  State<SupplierManagementScreen> createState() => _SupplierManagementScreenState();
}

class _SupplierManagementScreenState extends State<SupplierManagementScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor:AppColors.lightGrey,
        title: Text("اداره الموردين"),
        leading: SizedBox(),
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
          DetailsDataRow(txt: ["إجمالي الموردين","الموردين النشطين","الموردين غير النشطين"]),
          SizedBox(height: 24.h),
          BlocProvider(
            create: (context) => GetSuppliersCubit()..getAllSuppliers(),
            child: BlocBuilder<GetSuppliersCubit, GetSuppliersState>(
                builder: (context, state) {
                  if (state is GetAllSuppliersLoading) {
                    return LoadingWidget();
                  }
                  else if (state is GetAllSuppliersFailure) {
                    return GetDataFailureWidget(txt: state.failures.errorMsg);
                  } else if (state is GetAllSuppliersSuccess) {
                    final suppliers = context.read<GetSuppliersCubit>().suppliers;
                    if (suppliers.isEmpty) {
                      return GetEmptyDataWidget(txt: "no suppliers found");
                    }
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: LabelSearchRow(
                                  searchController: searchController,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              TableTitleRow(
                                title: [
                                  "اسم المورد",
                                  "رقم الجوال",
                                  "النوع",
                                  "رقم الهوية",
                                  "العنوان",
                                ],
                              ),
                              SizedBox(height: 8.h),
                              ...suppliers.map((supplier) => SupplierRow(supplier: supplier)).toList(),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox();
                }),
          ),
        ],
      ),
    );
  }
}

