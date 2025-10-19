import 'package:flutter/material.dart';

class AddSupplier extends StatelessWidget{
  const AddSupplier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("supplier",style:TextStyle(
        fontSize: 22,color: Colors.black
      ) ,)),
    );
  }
}
