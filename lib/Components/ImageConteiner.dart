import 'dart:ui';

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final ImageProvider<Object> img;
  final String name;
  const ImageContainer({Key key, this.img, this.name = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(image: img, fit: BoxFit.fill),
      ),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 25, color: Colors.red),
        ),
      ),
    );
  }
}
