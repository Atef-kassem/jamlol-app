import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/features/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:obour/features/sign_up/presentation/widgets/menu_drop_container.dart';
import 'package:obour/features/sign_up/presentation/widgets/upload_image_field.dart';
import '../../../../core/utils/components/custom_button.dart';
import '../../../login/presentation/widgets/password_input_field.dart';

class SignUpSecondScreen extends StatefulWidget{
  const SignUpSecondScreen({super.key});

  @override
  State<SignUpSecondScreen> createState() => _SignUpSecondScreenState();
}

class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text("رقم الجوال",style:Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 10.h,),
                    TextFieldItem(controller: phoneController, hint:"رقم الجوال",
                        icon:Icons.call, validateTxt: "Please enter your phone number"),
                    SizedBox(height: 24.h,),
                    Text("كلمه المرور",style:Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 10.h,),
                    PasswordInputField(controller: passwordController),
                    SizedBox(height: 24.h,),
                    Text("البريد الالكتروني",style:Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 10.h,),
                    TextFieldItem(controller: emailController, hint:"البريد الالكتروني", icon:Icons.text_fields, validateTxt: "Please enter your email"),
                    SizedBox(height: 24.h,),
                    Text("ارفع صورة",style:Theme.of(context).textTheme.bodySmall),
                    SizedBox(height: 10.h,),
                    UploadImageField(),
                    SizedBox(height: 24.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("الحالة",style:Theme.of(context).textTheme.bodySmall),
                            SizedBox(height: 10.h,),
                            MenuDropContainer(txt: "الحالة",),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("الدور",style:Theme.of(context).textTheme.bodySmall),
                            SizedBox(height: 10.h,),
                            MenuDropContainer(txt: "عميل/ناقل"),

                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 40.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ResetPasswordScreen(),));
                            },
                            child: CustomButton(txt: "تسجيل دخول")),
                      ],
                    )
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
