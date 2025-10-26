import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/core/utils/components/failure_dialog.dart';
import 'package:obour/core/utils/components/label_text.dart';
import 'package:obour/core/utils/components/loading_widget.dart';
import 'package:obour/core/utils/components/snack_bar_helper.dart';
import 'package:obour/core/utils/components/password_input_field.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/features/admin/buyer_management/presentation/pages/buyer_management_screen.dart';
import 'package:obour/features/auth/login/presentation/manager/login_cubit.dart';
import 'package:obour/features/auth/login/presentation/widgets/bg_body.dart';
import 'package:obour/features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:obour/features/home/presentation/pages/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    bool isLoading = state is LoginLoading;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: BgBody(),
              ),
              Positioned(
                top: 220,
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Card(
                          elevation: 8,
                          margin: EdgeInsets.all(16),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(24.r),
                            ),
                          ),
                          child: AnimatedPadding(
                            duration: const Duration(milliseconds: 300),
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: Form(
                              key: formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "تسجيل الدخول",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: AppColors.primaryColor,
                                              ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                   LabelText(txt: "البريد الالكتروني"),
                                    SizedBox(height: 10.h),
                                    TextFieldItem(
                                      controller: emailController,
                                      hint: "البريد الالكتروني",
                                      icon: Icons.text_fields,
                                      validateTxt: "Please enter your email",
                                    ),
                                    SizedBox(height: 24.h),
                                    LabelText(txt: "كلمه المرور"),
                                    SizedBox(height: 10.h),
                                    PasswordInputField(
                                      controller: passwordController,
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "هل نسيت كلمه المرور؟",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.red,
                                                fontSize: 12.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 32.h),
                                    BlocListener<LoginCubit, LoginState>(
                                      listener: (context, state) {
                                        if (state is LoginFailure) {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                FailureDialog(
                                                  msg:
                                                      state.failures.errorMsg,
                                                ),
                                          );
                                        } else if (state is LoginSuccess) {
                                          showCustomSnackBar(
                                            context: context,
                                            message: 'login successfully',
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BuyersManagementScreen(),
                                            ),
                                          );
                                        }
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          if (formKey.currentState
                                                  ?.validate() ==
                                              true) {
                                            LoginCubit.get(context).login(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text,
                                            );
                                          }
                                        },
                                        child: CustomButton(
                                          txt: "تسجيل دخول",
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 24.h),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "ليس لديك حساب؟ ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w700
                                            ),
                                          ),
                                          Text(
                                            "انشاء حساب جديد",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                color:AppColors.primaryColor,
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w700
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isLoading) LoadingWidget(),
            ],
          )
    );
  },
),
);
  }
}
