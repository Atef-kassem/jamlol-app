import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/features/auth/login/presentation/widgets/role_bg.dart';
import 'package:obour/features/auth/login/presentation/widgets/role_item.dart';
import 'package:obour/features/auth/sign_up/presentation/pages/sign_up_screen.dart';


class RolesScreen extends StatelessWidget{
  const RolesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: RoleBg()),
          SizedBox(height: 40.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoleItem(txt: "عميل",img: "assets/images/agent_icon.png",),
              RoleItem(txt: "ناقل",img: "assets/images/carrier_icon.png",),
            ],
          ),
          SizedBox(height: 32.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RoleItem(txt: "عميل",img: "assets/images/agent_icon.png",),
              RoleItem(txt: "ناقل",img: "assets/images/carrier_icon.png",),
            ],
          ),
          SizedBox(height: 54.h,),
          InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen(),));
              },
              child: CustomButton(txt: "متابعه"))

        ],
      ),
    );
  }
}
