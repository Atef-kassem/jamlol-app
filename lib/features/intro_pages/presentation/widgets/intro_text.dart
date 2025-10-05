import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obour/core/utils/app_colors.dart';

class IntroText extends StatelessWidget{
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("تسوق الحين و توصيل",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 28.sp
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text("علينا",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 28.sp,
                      color: AppColors.primaryColor
                  ),),
                  Image.asset("assets/images/line.png",width: 80.w,height: 16.h,)
                ],
              ),
              SizedBox(width: 4.w,),
              Text("طلبك",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 28.sp
              ),),
            ],
          ),
          SizedBox(height: 32.h,),
          Text("يا هلا فيك! انضم الينا الان واسمتع بتجربه"
            ,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Color(0XFF898A8D)
            ), textAlign:TextAlign.center,),
          Text("تسوق ممتعه وسهله عبر تطبيقنا"
            ,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Color(0XFF898A8D)
            ), textAlign:TextAlign.center,),
        ],
      ),
    );
  }
}
