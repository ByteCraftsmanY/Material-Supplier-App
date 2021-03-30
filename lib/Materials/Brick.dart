import 'package:flutter/cupertino.dart';

class Brick {
  String priceof_2000;
  String priceof_6000;
  String company;
  String status;
  ImageProvider<Object> img;
  String length, width, height;
  Brick(
      {this.height,
      this.length,
      this.img,
      this.status,
      this.width,
      this.company,
      this.priceof_2000,
      this.priceof_6000});
}