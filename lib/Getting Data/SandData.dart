import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_supplier_app/Components/SandCard.dart';
import 'package:material_supplier_app/Materials/Sand.dart';
import 'package:material_supplier_app/Pages/Loader.dart';
import 'package:material_supplier_app/Pages/SomethingWentWrong.dart';

class SandData extends StatelessWidget {
  static String id = 'SandData';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Sand').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return WentWrong();
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loader();
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return SandCard(
                item: Sand(
                  type: document.data()['type'],
                  price1t: document.data()['Price of 1 troly'],
                  price6w: document.data()['Price of 6 Wheel Dumpher'],
                  price10w: document.data()['Price of 10 Wheel Dumpher'],
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
