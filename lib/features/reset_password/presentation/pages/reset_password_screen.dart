import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/features/login/presentation/widgets/bg_body.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/features/reset_password/presentation/pages/verification_screen.dart';

class ResetPasswordScreen extends StatefulWidget{
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
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
            top: 180,
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
                                      Text("استعاده كلمه السر",style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                          color: AppColors.primaryColor
                                      ), textAlign: TextAlign.center,),
                                    ],
                                  ),
                                  SizedBox(height: 12.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text("أدخل حساب بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك",style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: AppColors.darkGrey,fontSize: 10.sp
                                        ),
                                        textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.h,),
                                  Text("البريد الالكتروني",style:Theme.of(context).textTheme.bodySmall),
                                  SizedBox(height: 10.h,),
                                  TextFieldItem(controller: emailController, hint:"البريد الالكتروني", icon:Icons.text_fields, validateTxt: "Please enter your email"),
                                  SizedBox(height: 40.h,),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => VerificationScreen(),));
                                      },
                                      child: CustomButton(txt: "ارسال كود"))
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
