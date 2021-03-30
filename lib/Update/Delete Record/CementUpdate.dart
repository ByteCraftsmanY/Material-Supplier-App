import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_supplier_app/Utility/Constants.dart';

class CementUpdate extends StatelessWidget {
  static String id = 'Cement Update';
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String company;
    String pricePerBag;
    String status;
    String deliveryCharge;
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
              pricePerBag = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Price per Bag'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              deliveryCharge = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Delivery Charge'),
          ),
          SizedBox(
            height: 25,
          ),
          IconButton(
            icon: Icon(Icons.cloud_upload_rounded),
            onPressed: () async {
              try {
                showDialog(
                  context: context,
                  builder: (context) =>
                      Center(child: CircularProgressIndicator()),
                );
                await _firestore.collection('Cement').doc('$company').update(
                  {
                    'Status': status,
                    'Price Per Beg': pricePerBag,
                    'deliveryCharge': deliveryCharge,
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
