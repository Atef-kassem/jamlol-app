import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleBg extends StatelessWidget{
  const RoleBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:AlignmentDirectional.center,
      children: [
        Image.asset("assets/images/login_role_bg.png",width: double.infinity,height: 320.h,fit: BoxFit.fitHeight,),
        Container(
          width: double.infinity,
          height: 320.h,
          decoration: BoxDecoration(
              color:Colors.black.withOpacity(.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            )
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h,),
              Image.asset("assets/images/white_logo.png",width: 250.w,height: 80.h,),
              SizedBox(height: 16.h,),
              Text("أهلا بك في عبور",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 28.sp,
                  color: Colors.white
              ),),
              SizedBox(height: 4.h,),
              Text(" انضم الينا الان واختر دورك واسمتع بتجربه تسوق ممتعه",
                textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white
              ),),
            ],
          ),
        )
      ],
    );
  }
}
