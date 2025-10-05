import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/config/routes/routes.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/features/intro_pages/presentation/widgets/custom_button.dart';
import 'package:obour/features/intro_pages/presentation/widgets/intro_text.dart';

class FirstIntroScreen extends StatelessWidget{
  const FirstIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset("assets/images/transformed.png",width:double.infinity,height: 340.h,),
          SizedBox(height: 40.h,),
          IntroText(),
          SizedBox(height: 24.h,),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context,RoutesName.secondIntroScreen);
            },
              child: CustomButton(txt: "أبدا الان"))
        ],
      ),
    );
  }
}
