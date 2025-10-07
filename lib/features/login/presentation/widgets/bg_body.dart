import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BgBody extends StatelessWidget{
  const BgBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset("assets/images/login_bg.png",width: double.infinity,height: 440.h),
        Container(
          width: double.infinity,
          height: 440.h,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:Colors.black.withOpacity(.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h,),
              Image.asset("assets/images/white_logo.png",width: 250.w,height: 80.h,),
              SizedBox(height: 16.h,),
              Text("أهلا بك في عبور",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 28.sp,
                  color: Colors.white
              ),),
              SizedBox(height: 4.h,),
              Text(" انضم الينا الان واسمتع بتجربه تسوق ممتعه",style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white
              ),
                textAlign:TextAlign.center,),
            ],
          ),
        )
      ],
    );
  }
}
