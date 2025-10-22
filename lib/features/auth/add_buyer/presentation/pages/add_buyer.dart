import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/helper/user_manager/user_manager.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/core/utils/components/label_text.dart';
import 'package:obour/core/utils/components/menu_drop_container.dart';
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
  List<String> statusList = ["active", "inActive"];
  String? selectedStatus;
  List<String> buyerTypeList = ["مؤسسه","فرد"];
  String? selectedPersonType;
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
        selectedStatus=UserManager().user?.status??"";
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    LabelText(txt: "اختيار مستخدم موجود"),
                    SizedBox(height: 10.h,),
                    MenuDropContainer(
                      label: 'بدون اختيار',
                      list: statusList,
                      itemLabel:(item) => item,
                      initialValue: selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "المنطقه"),
                    SizedBox(height: 10.h,),
                    MenuDropContainer(
                      label: 'اختر المنطقه',
                      list: statusList,
                      itemLabel:(item) => item,
                      initialValue: selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    LabelText(txt: "العنوان"),
                    SizedBox(height: 10.h,),
                    TextFieldItem(controller: addressController, hint:"العنوان",
                        icon:Icons.location_city, validateTxt: "Please enter your address"),
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
                    SizedBox(height: 24.h),
              LabelText(
                txt:"نوع الكيان",
              ),
              SizedBox(height: 10.h),
              MenuDropContainer(
                label: 'نوع الكيان',
                list:buyerTypeList,
                itemLabel:(item) => item,
                initialValue: selectedPersonType,
                onChanged: (value) {
                  setState(() {
                    selectedPersonType = value;
                  });
                },
              ),
                    SizedBox(height: 40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         InkWell(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
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
