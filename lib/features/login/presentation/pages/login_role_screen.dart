import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/features/intro_pages/presentation/widgets/custom_button.dart';
import 'package:obour/features/login/presentation/widgets/bg_body.dart';
import 'package:obour/features/login/presentation/widgets/drop_down_container.dart';

class LoginRoleScreen extends StatefulWidget{
  const LoginRoleScreen({super.key});

  @override
  State<LoginRoleScreen> createState() => _LoginRoleScreenState();
}

class _LoginRoleScreenState extends State<LoginRoleScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: AlignmentGeometry.topCenter,
              child: BgBody()),
          Positioned(
            top: 220,
            child: Align(
              alignment: AlignmentGeometry.center,
              child: Container(
                height: MediaQuery.of(context).size.height /2,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Card(
                    elevation: 8,
                    margin: EdgeInsets.all(16),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.all(Radius.circular(24.r))),
                    child: Form(
                        key: formKey,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("اختر الدور",style:Theme.of(context).textTheme.bodySmall),
                              SizedBox(height: 10.h,),
                              DropDownContainer(),
                              SizedBox(height: 48.h,),
                              InkWell(
                                  onTap: () {

                                  },
                                  child: CustomButton(txt: "متابعه"))
                            ],
                          ),
                        )),
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
