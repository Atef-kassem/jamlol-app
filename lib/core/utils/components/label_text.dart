import 'package:flutter/material.dart';

class LabelText extends StatelessWidget{
  final String txt;
  const LabelText({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return  Text(txt,style:Theme.of(context).textTheme.bodySmall);
  }
}
