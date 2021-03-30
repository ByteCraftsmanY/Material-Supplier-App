import 'package:flutter/cupertino.dart';

class IronRods {
  String company;
  String status;
  ImageProvider<Object> img;
  String dia;
  String deliveryCharge;
  String price;
  IronRods(
      {this.company,
      this.price,
      this.dia,
      this.img,
      this.status,
      this.deliveryCharge});
}
