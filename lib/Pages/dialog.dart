import 'package:flutter/material.dart';

Future<void> showdialog({context,String s}) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(s),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
