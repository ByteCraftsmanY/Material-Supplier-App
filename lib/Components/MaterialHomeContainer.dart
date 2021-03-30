import 'package:flutter/material.dart';

class MaterialConteiner extends StatelessWidget {
  const MaterialConteiner({
    Key key,
    this.img,
    this.type,
  }) : super(key: key);
  final ImageProvider<Object> img;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      height: 200,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: img,
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white,fontFamily: 'Ubuntu',backgroundColor: Colors.white30),
        ),
      ),
    );
  }
}