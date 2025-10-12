import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/features/login/presentation/pages/login_role_screen.dart';
import 'package:obour/features/login/presentation/widgets/bg_body.dart';
import 'package:obour/features/login/presentation/widgets/password_input_field.dart';
import 'package:obour/core/utils/components/text_field_item.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                height: MediaQuery.of(context).size.height /1.7,
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
                              Text("رقم الجوال",style:Theme.of(context).textTheme.bodySmall),
                              SizedBox(height: 10.h,),
                              TextFieldItem(controller: phoneController, hint:"رقم الجوال", icon:Icons.call, validateTxt: "Please enter your phone number"),
                              SizedBox(height: 32.h,),
                              Text("كلمه المرور",style:Theme.of(context).textTheme.bodySmall),
                              SizedBox(height: 10.h,),
                              PasswordInputField(controller: passwordController),
                              SizedBox(height: 12.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("هل نسيت كلمه المرور؟",style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.red,fontSize: 12.sp
                                  )),
                                ],
                              ),
                              SizedBox(height: 48.h,),
                              InkWell(
                                onTap: () {
                                 Navigator.push(context,MaterialPageRoute(builder: (context) => LoginRoleScreen(),));
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
