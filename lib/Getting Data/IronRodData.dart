import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_supplier_app/Components/IronRodCard.dart';
import 'package:material_supplier_app/Materials/IronRode.dart';
import 'package:material_supplier_app/Pages/Loader.dart';
import 'package:material_supplier_app/Pages/SomethingWentWrong.dart';

class IronRodData extends StatelessWidget {
  static String id = 'IronROdData';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('IronRode').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return WentWrong();
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loader();
          return ListView(
            children: snapshot.data.docs.map(
              (DocumentSnapshot document) {
                return IronRodCard(
                  item: IronRods(
                    company: document.data()['Company'],
                    deliveryCharge: document.data()['deliveryCharge'],
                    status: document.data()['Diameter'],
                    dia: document.data()['Weight'],
                    price: document.data()['Price Per Ton'],
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
