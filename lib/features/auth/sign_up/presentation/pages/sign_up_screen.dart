import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/config/routes/routes.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/features/auth/login/presentation/widgets/bg_body.dart';
import 'package:obour/features/auth/sign_up/presentation/widgets/label_text.dart';
import 'package:obour/core/utils/components/text_field_item.dart';


class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: BgBody()),
          Positioned(
            top: 220,
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height /1.5,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 8,
                      margin: EdgeInsets.all(16),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(Radius.circular(24.r))),
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 300),
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Form(
                            key: formKey,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("انشاء حساب!",style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: AppColors.primaryColor
                                      ), textAlign: TextAlign.center,),
                                    ],
                                  ),
                                  SizedBox(height: 24.h,),
                                  LabelText(txt: "الاسم بالكامل"),
                                  SizedBox(height: 10.h,),
                                  TextFieldItem(controller: nameController, hint:"الاسم", icon:Icons.text_fields, validateTxt: "Please enter your name"),
                                  SizedBox(height: 24.h,),
                                  LabelText(txt: "اسم المستخدم"),
                                  SizedBox(height: 10.h,),
                                  TextFieldItem(controller: userNameController, hint:"اسم المستخدم", icon:Icons.person, validateTxt: "Please enter your user name"),
                                  SizedBox(height: 24.h,),
                                  LabelText(txt: "العنوان"),
                                  SizedBox(height: 10.h,),
                                  TextFieldItem(controller: addressController, hint:"العنوان",
                                      icon:Icons.location_city, validateTxt: "Please enter your address"),
                                  SizedBox(height: 40.h,),
                                  InkWell(
                                      onTap: () {
                                        if (formKey.currentState?.validate() ==
                                            true) {
                                          print("name${nameController.text}");
                                        Navigator.pushNamed(context,RoutesName.secondSignUp,arguments:{
                                          'name':nameController.text,
                                          'userName': userNameController.text,
                                          'address': addressController.text,
                                        });}
                                      },
                                      child: CustomButton(txt: "متابعه"))
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
