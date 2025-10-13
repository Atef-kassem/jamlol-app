import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/core/utils/components/failure_dialog.dart';
import 'package:obour/core/utils/components/loading_widget.dart';
import 'package:obour/features/login/presentation/manager/login_cubit.dart';
import 'package:obour/features/login/presentation/pages/login_role_screen.dart';
import 'package:obour/features/login/presentation/pages/roles_screen.dart';
import 'package:obour/features/login/presentation/widgets/bg_body.dart';
import 'package:obour/core/utils/components/password_input_field.dart';
import 'package:obour/core/utils/components/text_field_item.dart';

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
                    height: MediaQuery.of(context).size.height / 1.7,
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
                                    SizedBox(height: 10.h),
                                    Text(
                                      "البريد الالكتروني",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    SizedBox(height: 10.h),
                                    TextFieldItem(
                                      controller: emailController,
                                      hint: "البريد الالكتروني",
                                      icon: Icons.text_fields,
                                      validateTxt: "Please enter your email",
                                    ),
                                    SizedBox(height: 32.h),
                                    Text(
                                      "كلمه المرور",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
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
                                    SizedBox(height: 48.h),
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
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Center(
                                                child: Text(
                                                  "Login successfully",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                              ),
                                              backgroundColor: Colors.green,
                                              duration: Duration(seconds: 5),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              margin: EdgeInsets.all(24),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                vertical: 12,
                                                horizontal: 4,
                                              ),
                                            ),
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginRoleScreen(),
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
