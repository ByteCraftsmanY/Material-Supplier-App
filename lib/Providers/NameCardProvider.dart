import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContactProvider extends ChangeNotifier {
  ImageProvider<Object> img = AssetImage('assets/photo.jpg');
  String name = 'Cat';
  Color top = Colors.white;
  Color bottom = Color(0xffdbf7ff);
  String phone = '+918934567890';
  String address = 'Seoni Madhya Pradesh';
  String lat = '22.055117';
  String lng = '79.541469';
  String email = 'abc@mail.com';
}
