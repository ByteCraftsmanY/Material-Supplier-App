import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:material_supplier_app/Pages/dialog.dart';
import 'package:material_supplier_app/Utility/ImagePicker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:firebase/firestore.dart';
import '../Utility/Constants.dart';

class BrickDataCard extends StatelessWidget {
  static String id = 'Brick Data Card';
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    String company;
    String priceof_2000;
    String priceof_6000;
    String status;
    String length, width, height;
    String url;
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
              length = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Length'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              width = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Width'),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            onChanged: (val) {
              height = val;
            },
            textAlign: TextAlign.center,
            decoration: ktxtfieldstyle.copyWith(hintText: 'Height'),
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
                  await _storage.ref('Bricks/$company.png').putFile(image);
                  url =
                      await _storage.ref('Bricks/$company.png').getDownloadURL();
                  await _firestore.collection('Bricks').doc('$company').set(
                    {
                      'Image Url': url,
                      'Company': company,
                      'Length': length,
                      'Width': width,
                      'Height': height,
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
