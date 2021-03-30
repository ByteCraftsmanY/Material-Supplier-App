import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:material_supplier_app/Pages/dialog.dart';
import 'package:material_supplier_app/Utility/ImagePicker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase/firestore.dart';
import '../Utility/Constants.dart';

class CementDataCard extends StatelessWidget {
  static String id = 'Cement Data Card';
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String company;
    String pricePerBag;
    String status;
    String weight;
    String url;
    String deliveryCharge;
    File image;
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
              weight = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Weight'),
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
          OutlinedButton(
            onPressed: () async {
              image = File(
                await getFIle(context),
              );
            },
            child: Text('Select Image'),
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
                  await _storage.ref('Cement/$company.png').putFile(image);
                  url = await _storage
                      .ref('Cement/$company.png')
                      .getDownloadURL();
                  await _firestore.collection('Cement').doc('$company').set(
                    {
                      'Image Url': url,
                      'Company': company,
                      'Status': status,
                      'Weight': weight,
                      'Price Per Beg': pricePerBag,
                      'deliveryCharge': deliveryCharge,
                    },
                  );
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Done'),
                      content: Text('Upload Sucess'),
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
