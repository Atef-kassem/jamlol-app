import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/helper/user_manager/user_manager.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/core/utils/components/label_text.dart';
import 'package:obour/core/utils/components/menu_drop_container.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';
import 'package:obour/features/auth/add_supplier/presentation/manager/get_region_manager/get_regions_cubit.dart';
import 'package:obour/features/home/presentation/pages/home_screen.dart';

class AddSupplier extends StatefulWidget {
  const AddSupplier({super.key});

  @override
  State<AddSupplier> createState() => _AddSupplierState();
}

class _AddSupplierState extends State<AddSupplier> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  List<String> statusList = ["active", "inActive"];
  String? selectedStatus;
  List<String> supplierTypeList = ["person", "company"];
  List<String> idTypeList = ["card", "sgl"];
  String? selectedIdType;
  String? selectedPersonType;
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
      nameController.text = UserManager().user?.name ?? "";
      phoneController.text = UserManager().user?.phone ?? "";
      addressController.text = UserManager().user?.address ?? "";
      selectedStatus = UserManager().user?.status ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مورد")),
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
                    LabelText(txt: "اسم المورد"),
                    SizedBox(height: 10.h),
                    TextFieldItem(
                      controller: nameController,
                      hint: "اسم المورد",
                      icon: Icons.text_fields,
                      validateTxt: "Please enter your name",
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "رقم الجوال"),
                    SizedBox(height: 10.h),
                    TextFieldItem(
                      controller: phoneController,
                      hint: "رقم الجوال",
                      icon: Icons.call,
                      validateTxt: "Please enter your phone number",
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "نوع المورد"),
                    SizedBox(height: 10.h),
                    MenuDropContainer(
                      label: 'فرد',
                      list: supplierTypeList,
                      initialValue: selectedPersonType,
                      itemLabel: (item) => item,
                      onChanged: (value) {
                        setState(() {
                          selectedPersonType = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "رقم الهويه"),
                    SizedBox(height: 10.h),
                    TextFieldItem(
                      controller: idController,
                      hint: "رقم الهويه",
                      icon: Icons.text_fields,
                      validateTxt: "Please enter your id number",
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "اختيار نوع الهويه"),
                    SizedBox(height: 10.h),
                    MenuDropContainer(
                      label: 'نوع الهويه',
                      list: idTypeList,
                      itemLabel: (item) => item,
                      initialValue: selectedIdType,
                      onChanged: (value) {
                        setState(() {
                          selectedIdType = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "العنوان"),
                    SizedBox(height: 10.h),
                    TextFieldItem(
                      controller: addressController,
                      hint: "العنوان",
                      icon: Icons.location_city,
                      validateTxt: "Please enter your address",
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "المنطقه"),
                    SizedBox(height: 10.h),
                    BlocProvider(
                      create: (context) => GetRegionsCubit()..getRegions(),
                      child: BlocBuilder<GetRegionsCubit, GetRegionsState>(
                        builder: (context, state) {
                          final regions = GetRegionsCubit.get(
                            context,
                          ).regionsData;
                          if (state is GetRegionsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is GetRegionsSuccess) {
                            return MenuDropContainer<Regions>(
                              label: 'اختر المنطقه',
                              list: regions,
                              itemLabel: (region) => region?.name??"",
                              initialValue: selectedRegion,
                              onChanged: (value) {
                                setState(() {
                                  selectedRegion = value;
                                  regionId =
                                      value?.id??0; // English/ID saved
                                });
                              },
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "الحالة"),
                    SizedBox(height: 10.h),
                    MenuDropContainer(
                      label: 'الحالة',
                      list: statusList,
                      itemLabel: (item) => item,
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: CustomButton(txt: "دخول للصفحه الرئيسية"),
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
    );
  }
}
