import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/components/failure_dialog.dart';
import 'package:obour/core/utils/components/loading_widget.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/features/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:obour/features/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:obour/features/sign_up/presentation/widgets/menu_drop_container.dart';
import 'package:obour/features/sign_up/presentation/widgets/upload_image_field.dart';
import '../../../../core/utils/components/custom_button.dart';
import '../../../../core/utils/components/password_input_field.dart';

class SignUpSecondScreen extends StatefulWidget {
  const SignUpSecondScreen({super.key});

  @override
  State<SignUpSecondScreen> createState() => _SignUpSecondScreenState();
}

class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<String> statusList=["active","inActive"];
  List<String> personTypeList=["admin","supplier","client","carrier"];
  var formKey = GlobalKey<FormState>();
  Map<String, dynamic>? args;

  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, dynamic>?;
  }
    @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          bool isLoading = state is SignUpLoading;
          return Stack(
            children: [
              Scaffold(
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
                              Text(
                                "رقم الجوال",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(height: 10.h),
                              TextFieldItem(
                                controller: phoneController,
                                hint: "رقم الجوال",
                                icon: Icons.call,
                                validateTxt: "Please enter your phone number",
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                "كلمه المرور",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(height: 10.h),
                              PasswordInputField(
                                controller: passwordController,
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                "البريد الالكتروني",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(height: 10.h),
                              TextFieldItem(
                                controller: emailController,
                                hint: "البريد الالكتروني",
                                icon: Icons.text_fields,
                                validateTxt: "Please enter your email",
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                "ارفع صورة",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(height: 10.h),
                              UploadImageField(),
                              SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "الحالة",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 10.h),
                                      MenuDropContainer(txt: "الحالة"),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "الدور",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      SizedBox(height: 10.h),
                                      MenuDropContainer(txt: "عميل/ناقل"),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 40.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BlocListener<SignUpCubit, SignUpState>(
                                    listener: (context, state) {
                                      if (state is SignUpFailure) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => FailureDialog(
                                            msg: state.failures.errorMsg,
                                          ),
                                        );
                                      } else if (state is SignUpSuccess) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Center(
                                              child: Text(
                                                "SignUp successfully",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 5),
                                            behavior: SnackBarBehavior.floating,
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
                                                ResetPasswordScreen(),
                                          ),
                                        );
                                      }
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        if (formKey.currentState?.validate() ==
                                            true) {
                                          SignUpCubit.get(context).signUp(
                                            roleId: 1,
                                            name: args?["name"]??"",
                                            userName: args?["userName"]??"",
                                            address: args?["address"]??"",
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                            status: "active",
                                            personType: "admin",
                                          );
                                        }
                                      },
                                      child: CustomButton(txt: "تسجيل دخول"),
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
