import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/helper/user_manager/user_manager.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/core/utils/components/failure_dialog.dart';
import 'package:obour/core/utils/components/loading_widget.dart';
import 'package:obour/core/utils/components/snack_bar_helper.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/core/utils/components/label_text.dart';
import 'package:obour/core/utils/components/menu_drop_container.dart';
import 'package:obour/features/auth/add_buyer/presentation/manager/add_buyer_cubit.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';
import 'package:obour/features/auth/add_supplier/presentation/manager/get_region_manager/get_regions_cubit.dart';
import 'package:obour/features/home/presentation/pages/home_screen.dart';

class AddBuyer extends StatefulWidget{
  const AddBuyer({super.key});

  @override
  State<AddBuyer> createState() => _AddBuyerState();
}

class _AddBuyerState extends State<AddBuyer> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  List<String> statusList = ["active", "inactive"];
  String? selectedStatus;
  Regions? selectedRegion;
  int? regionId;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
      setState(() {
        nameController.text =UserManager().user?.username??"";
        phoneController.text = UserManager().user?.phone??"";
        addressController.text =UserManager().user?.address??"";
      });
    }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddBuyerCubit(),
  child: BlocBuilder<AddBuyerCubit, AddBuyerState>(
  builder: (context, state) {
    bool isLoading = state is AddBuyerLoading;
    return Stack(
      children: [
        Scaffold(
          appBar:AppBar(
            title: Text("مشتري"),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelText(txt: "اسم المشتري"),
                        SizedBox(height: 10.h,),
                        TextFieldItem(controller: nameController, hint:"اسم المشتري", icon:Icons.text_fields, validateTxt: "Please enter your name"),
                        SizedBox(height: 24.h),
                        LabelText(
                          txt:"رقم الجوال",),
                        SizedBox(height: 10.h),
                        TextFieldItem(
                          controller: phoneController,
                          hint: "رقم الجوال",
                          icon: Icons.call,
                          validateTxt: "Please enter your phone number",
                        ),
                        SizedBox(height: 24.h),
                        LabelText(txt: "العنوان"),
                        SizedBox(height: 10.h,),
                        TextFieldItem(controller: addressController, hint:"العنوان",
                            icon:Icons.location_city, validateTxt: "Please enter your address"),
                        SizedBox(height: 24.h),
                        LabelText(txt: "المنطقه"),
                        SizedBox(height: 10.h,),
                        BlocProvider(
                          create: (context) =>
                          GetRegionsCubit()
                            ..getRegions(),
                          child: BlocBuilder<
                              GetRegionsCubit,
                              GetRegionsState>(
                            builder: (context, state) {
                              final regions = GetRegionsCubit
                                  .get(
                                context,
                              )
                                  .regionsData;
                              if (state is GetRegionsLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
        
                              if (state is GetRegionsSuccess) {
                                return MenuDropContainer<Regions>(
                                  label: 'اختر المنطقه',
                                  list: regions,
                                  itemLabel: (region) =>
                                  region?.name ?? "",
                                  initialValue: selectedRegion,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRegion = value;
                                      regionId =
                                          value?.id ??
                                              0; // English/ID saved
                                    });
                                  },
                                );
                              }
        
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        SizedBox(height: 24.h),
                        LabelText(
                          txt: "الحالة",
                        ),
                        SizedBox(height: 10.h),
                        MenuDropContainer(
                          label: 'الحالة',
                          list: statusList,
                          itemLabel:(item) => item,
                          initialValue: selectedStatus,
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value;
                            });
                          },
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocListener<AddBuyerCubit,AddBuyerState>(
                              listener: (context, state) {
                                if (state is AddBuyerFailure) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => FailureDialog(
                                      msg: state.failures.errorMsg,
                                    ),
                                  );
                                } else if (state is AddBuyerSuccess) {
                                  showCustomSnackBar(
                                    context: context,
                                    message: 'Add Buyer successfully',
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                }
                              },
                              child: InkWell(
                                onTap: () {
                                  if (formKey.currentState?.validate() ==
                                      true) {
                                    print(
                                      " selectedStatus $selectedStatus",
                                    );
                                    print(
                                      " selectedregion id $regionId",
                                    );
                                    print(
                                      " selectedregion  $selectedRegion",
                                    );
                                    AddBuyerCubit.get(context)
                                        .addBuyer(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        address: addressController.text,
                                        status: selectedStatus ?? "",
                                        regionId: regionId ?? 0);
                                  }
                                },
                                child: CustomButton(
                                    txt: "دخول للصفحه الرئيسية"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isLoading) LoadingWidget(),
      ],
    );
  },
),
);
  }
}
