import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_supplier_app/Components/brickcard.dart';
import 'package:material_supplier_app/Materials/Brick.dart';
import 'package:material_supplier_app/Pages/Loader.dart';
import 'package:material_supplier_app/Pages/SomethingWentWrong.dart';

class BrickData extends StatelessWidget {
  static String id = 'BrickData';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Bricks').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return WentWrong();
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loader();
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Brick b;
              try {
                String p = document.data()['Company'];
                print(p);
                // b.height = document.data()['Height'];
                // print(b.height);
                // b.img = NetworkImage('${document.data()['Image Url']}');
                // b.length = document.data()['Length'];
                // b.width = document.data()['Width'];
                // b.priceof_2000 = document.data()['Price of 2000'];
                // b.priceof_6000 = document.data()['Price of 6000'];
                print(b);
              } catch (e) {
                print(e);
              }
              return BrickCard(
                item: Brick(
                  company: document.data()['Company'],
                  priceof_2000: document.data()['Price of 2000'],
                  priceof_6000: document.data()['Price of 6000'],
                  length: document.data()['Length'],
                  width: document.data()['Width'],
                  height: document.data()['Height'],
                  status: document.data()['Status'],
                  img: NetworkImage('${document.data()['Image Url']}'),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
