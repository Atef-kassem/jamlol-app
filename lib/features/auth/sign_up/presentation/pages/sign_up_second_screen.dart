import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/core/utils/components/failure_dialog.dart';
import 'package:obour/core/utils/components/loading_widget.dart';
import 'package:obour/core/utils/components/password_input_field.dart';
import 'package:obour/core/utils/components/snack_bar_helper.dart';
import 'package:obour/core/utils/components/text_field_item.dart';
import 'package:obour/features/auth/add_buyer/presentation/pages/add_buyer.dart';
import 'package:obour/features/auth/add_supplier/presentation/pages/add_supplier.dart';
import 'package:obour/features/auth/reset_password/presentation/pages/reset_password_screen.dart';
import 'package:obour/features/auth/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:obour/features/auth/sign_up/presentation/widgets/label_text.dart';
import 'package:obour/features/auth/sign_up/presentation/widgets/menu_drop_container.dart';
import 'package:obour/features/auth/sign_up/presentation/widgets/upload_image_field.dart';

class SignUpSecondScreen extends StatefulWidget {
  const SignUpSecondScreen({super.key});

  @override
  State<SignUpSecondScreen> createState() => _SignUpSecondScreenState();
}

class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<String> statusList = ["active", "inActive"];
  String? selectedStatus="active";
  List<String> personTypeList = ["admin", "supplier", "client", "carrier"];
  String? selectedPersonType="client";
  var formKey = GlobalKey<FormState>();
  Map<String, dynamic>? args;

  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    print('✅ Received args: $args');
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
                              LabelText(txt: "رقم الجوال"),
                              SizedBox(height: 10.h),
                              TextFieldItem(
                                controller: phoneController,
                                hint: "رقم الجوال",
                                icon: Icons.call,
                                validateTxt: "Please enter your phone number",
                              ),
                              SizedBox(height: 24.h),
                              LabelText(txt: "كلمه المرور"),
                              SizedBox(height: 10.h),
                              PasswordInputField(
                                controller: passwordController,
                              ),
                              SizedBox(height: 24.h),
                              LabelText(txt: "البريد الالكتروني"),
                              SizedBox(height: 10.h),
                              TextFieldItem(
                                controller: emailController,
                                hint: "البريد الالكتروني",
                                icon: Icons.text_fields,
                                validateTxt: "Please enter your email",
                              ),
                              SizedBox(height: 24.h),
                              LabelText(txt: "ارفع صورة"),
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
                                      LabelText(txt: "الحالة"),
                                      SizedBox(height: 10.h),
                                      MenuDropContainer(
                                        label: 'الحالة',
                                        list: statusList,
                                        initialValue: selectedStatus,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedStatus = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LabelText(txt: "الدور"),
                                      SizedBox(height: 10.h),
                                      MenuDropContainer(
                                        label: 'الدور',
                                        list: personTypeList,
                                        initialValue: selectedPersonType,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPersonType = value;
                                          });
                                        },
                                      ),
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
                                        showCustomSnackBar(
                                          context: context,
                                          message: 'SignUp successfully',
                                        );
                                        if (selectedPersonType == "supplier") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddSupplier(),
                                            ),
                                          );
                                        } else if (selectedPersonType == "client") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddBuyer(),
                                            ),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ResetPasswordScreen(),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: InkWell(
                                      onTap: () {
                                        if (formKey.currentState?.validate() ==
                                            true) {
                                          print(" selectedStatus $selectedStatus" );
                                          print(" name ${ args?["name"] }" );
                                          print(" selectedperson type $selectedPersonType" );
                                          print(" address ${ args?["address"] }" );
                                          SignUpCubit.get(context).signUp(
                                            roleId: 1,
                                            name: args?["name"] ?? "",
                                            userName: args?["userName"] ?? "",
                                            address: args?["address"] ?? "",
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                            status: selectedStatus ?? "",
                                            personType:
                                                selectedPersonType ?? "",
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
