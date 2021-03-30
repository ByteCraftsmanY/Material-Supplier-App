import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_supplier_app/Utility/Constants.dart';

class BrickUpdate extends StatelessWidget {
  static String id = 'Brick Update';
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String company;
    String priceof_2000;
    String priceof_6000;
    String status;
    return Container(
      child: ListView(
        padding: EdgeInsets.all(23),
        addRepaintBoundaries: true,
        children: [
          TextField(
            onChanged: (val) {
              company = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Company Name'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              status = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Status'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              priceof_2000 = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Price of 2000'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              priceof_6000 = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'price of 6000'),
          ),
          SizedBox(
            height: 25,
          ),
          IconButton(
            icon: Icon(Icons.cloud_upload_rounded,),
            onPressed: () async {
              try {
                showDialog(
                  context: context,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
                await _firestore.collection('Bricks').doc('$company').update(
                  {
                    'Status': status,
                    'Price of 2000': priceof_2000,
                    'Price of 6000': priceof_6000,
                  },
                );
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Done'),
                    content: Text('Update Sucess'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Error'),
                    content: Text(e.toString()),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Try Again'),
                      ),
                    ],
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
