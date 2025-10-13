import 'package:flutter/material.dart';

class FailureDialog extends StatelessWidget{
  String msg;
   FailureDialog({super.key,required this.msg});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        backgroundColor: Colors.grey[200],
        title: Text(
          "Error",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        content: Text(
          msg,
          style: Theme.of(context).textTheme.bodySmall,
           textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "okay",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
  }
}
