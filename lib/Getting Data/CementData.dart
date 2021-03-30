import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_supplier_app/Components/CementCard.dart';
import 'package:material_supplier_app/Materials/Cement.dart';
import 'package:material_supplier_app/Pages/Loader.dart';
import 'package:material_supplier_app/Pages/SomethingWentWrong.dart';

class CementData extends StatelessWidget {
  static String id = 'CementData';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Cement').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return WentWrong();
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loader();
          return ListView(
            children: snapshot.data.docs.map(
              (DocumentSnapshot document) {
                return CementCard(
                  item: Cement(
                    company: document.data()['Company'],
                    deliveryCharge: document.data()['deliveryCharge'],
                    status: document.data()['Status'],
                    weight: document.data()['Weight'],
                    price: document.data()['Price Per Beg'],
                    img: NetworkImage('${document.data()['Image Url']}'),
                  ),
                );
              },
            ).toList(),
          );
        },
      ),
    );
  }
}
