import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/features/intro_pages/presentation/widgets/custom_button.dart';
import 'package:obour/features/login/presentation/widgets/bg_body.dart';
import 'package:obour/features/login/presentation/widgets/password_input_field.dart';
import 'package:obour/features/login/presentation/widgets/text_field_item.dart';
import 'package:obour/features/reset_password/presentation/pages/reset_password_screen.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                                  SizedBox(height: 10.h,),
                                  Text("الاسم",style:Theme.of(context).textTheme.bodySmall),
                                  SizedBox(height: 10.h,),
                                  TextFieldItem(controller: phoneController, hint:"الاسم", icon:Icons.text_fields, validateTxt: "Please enter your name"),
                                  SizedBox(height: 24.h,),
                                  Text("العمر",style:Theme.of(context).textTheme.bodySmall),
                                  SizedBox(height: 10.h,),
                                  TextFieldItem(controller: phoneController, hint:"العمر", icon:Icons.text_fields, validateTxt: "Please enter your age"),
                                  SizedBox(height: 24.h,),
                                  Text("كلمه المرور",style:Theme.of(context).textTheme.bodySmall),
                                  SizedBox(height: 10.h,),
                                  PasswordInputField(controller: passwordController),
                                  SizedBox(height: 40.h,),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => ResetPasswordScreen(),));
                                      },
                                      child: CustomButton(txt: "تسجيل دخول"))
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
