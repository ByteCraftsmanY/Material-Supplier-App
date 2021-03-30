import 'package:flutter/cupertino.dart';

class Cement {
  String company;
  String status;
  ImageProvider<Object> img;
  String weight;
  String price;
  String deliveryCharge;
  Cement(
      {this.company,
      this.weight,
      this.deliveryCharge,
      this.price,
      this.img,
      this.status});
}
