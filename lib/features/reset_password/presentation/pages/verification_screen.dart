import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/features/login/presentation/widgets/bg_body.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget{
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  var code = '';
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
                height: MediaQuery.of(context).size.height/1.7,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SingleChildScrollView(
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        margin: EdgeInsets.all(16),
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(Radius.circular(24.r))),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "التحقق من OTP",
                                        textAlign: TextAlign.center,
                                      style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: AppColors.primaryColor
                                      )
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                        "تحقّق من بريدك الإلكتروني لاستخدام رمز التحقق.",
                                        textAlign: TextAlign.center,
                                        style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: AppColors.darkGrey,
                                          fontSize: 12.sp
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Pinput(
                                length: 4,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6),
                                ],
                                keyboardType: TextInputType.number,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                onChanged: (value) {
                                  setState(() {
                                    code = value;
                                  });
                                  print('Changed:,$value');
                                },
                                onCompleted: (value) {
                                  print('Completed:,$value');
                                },
                                onSubmitted: (value) {
                                  print('Submitted:,$value');
                                },
                                defaultPinTheme: PinTheme(
                                  height: 60.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                ),
                                focusedPinTheme: PinTheme(
                                  height: 60.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                ),
                                submittedPinTheme: PinTheme(
                                  height: 60.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryColor
                                    ),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "لم تستلم الرمز؟اطلب رمزًا آخر من",
                                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                          fontSize: 10.sp
                                      )
                                  ),
                                  SizedBox(width: 4,),
                                  Text(
                                      "هنا.",
                                      style:Theme.of(context).textTheme.bodySmall!.copyWith(
                                          fontSize: 10.sp,
                                        color: AppColors.primaryColor
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => VerificationScreen(),));
                                  },
                                  child: CustomButton(txt: "متابعه"))
                            ],
                          ),
                        ),
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
