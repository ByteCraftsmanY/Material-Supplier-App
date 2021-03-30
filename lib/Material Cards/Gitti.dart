import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:material_supplier_app/Pages/dialog.dart';
import 'package:material_supplier_app/Utility/ImagePicker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase/firestore.dart';
import '../Utility/Constants.dart';

class GittiDataCard extends StatelessWidget {
  static String id = 'Gitti Data Card';
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String priceofTroly;
    String priceof6;
    String priceof10;
    String status;
    String type;
    String url;
    File image;
    return Container(
      child: ListView(
        padding: EdgeInsets.all(23),
        addRepaintBoundaries: true,
        children: [
          TextField(
            onChanged: (val) {
              type = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'type'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              priceofTroly = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Price of 1 Troly'),
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
              priceof6 = val;
            },
            textAlign: TextAlign.center,
            decoration:
                ktxtfieldstyle.copyWith(hintText: 'Price of 6 Wheeel Dumpher'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              priceof10 = val;
            },
            textAlign: TextAlign.center,
            decoration:
                ktxtfieldstyle.copyWith(hintText: 'price of 10 Wheel Dumpher'),
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
                  await _storage.ref('Gitti/$type.png').putFile(image);
                  url = await _storage.ref('Gitti/$type.png').getDownloadURL();
                  await _firestore.collection('Gitti').doc('$type').set(
                    {
                      'Image Url': url,
                      'type': type,
                      'Status': status,
                      'Price of 1 troly': priceofTroly,
                      'Price of 6 Wheel Dumpher': priceof6,
                      'Price of 10 Wheel Dumpher': priceof10,
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
