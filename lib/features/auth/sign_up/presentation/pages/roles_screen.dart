import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';
import 'package:obour/core/utils/components/custom_button.dart';
import 'package:obour/features/auth/add_buyer/presentation/pages/add_buyer.dart';
import 'package:obour/features/auth/add_carrier/presentation/pages/add_carrier.dart';
import 'package:obour/features/auth/add_supplier/presentation/pages/add_supplier.dart';
import 'package:obour/features/auth/sign_up/presentation/widgets/role_bg.dart';
import 'package:obour/features/auth/sign_up/presentation/widgets/role_item.dart';
import 'package:obour/features/auth/sign_up/presentation/pages/sign_up_screen.dart';
import 'package:obour/features/home/presentation/pages/home_screen.dart';


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
              InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AddSupplier(),));
                },
                  child: RoleItem(txt: "مورد",img: "assets/images/supplier_icon.png",color: Colors.white,)),
              RoleItem(txt: "مستخدم",img: "assets/images/user_icon.png",color: Colors.white,),
            ],
          ),
          SizedBox(height: 32.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AddBuyer(),));
                },
                  child: RoleItem(txt: "مشتري",img: "assets/images/buyer_icon.png",color: AppColors.primaryColor,)),
              InkWell(onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => AddCarrier(),));
              },
                  child: RoleItem(txt: "ناقل",img: "assets/images/carrier_icon.png",color: Colors.white,)),
            ],
          ),
          SizedBox(height: 54.h,),
          InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              child: CustomButton(txt: "متابعه"))

        ],
      ),
    );
  }
}
