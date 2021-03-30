import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_supplier_app/Utility/Constants.dart';

class IronUpdate extends StatelessWidget {
  static String id = 'IronRod Update';
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String company;
    String pricePerTons;
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
              pricePerTons = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Price per tons'),
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
                  await _firestore.collection('IronRode').doc('$company').update(
                    {
                      'Status': status,
                      'Price Per Ton': pricePerTons,
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
              })
        ],
      ),
    );
  }
}
