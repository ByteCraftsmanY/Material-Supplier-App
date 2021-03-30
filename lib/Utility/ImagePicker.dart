import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<String> getFIle(context) async {
  try {
    var temp = await ImagePicker().getImage(source: ImageSource.gallery);
    // File img = File(temp.path);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Loaded'),
          actions: [
            OutlinedButton(
              
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ok'),
            )
          ],
        );
      },
    );
    print(temp.path);
    return temp.path;
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            e.toString(),
          ),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ok'),
            )
          ],
        );
      },
    );
    print(e);
  }
  return 'Try Again';
}
