import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_supplier_app/Utility/Constants.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DataDeleteCard extends StatelessWidget {
  final String type;
  DataDeleteCard({this.type});
  @override
  Widget build(BuildContext context) {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    String name;
    final ctrl = TextEditingController();
    return Container(
      child: Center(
        child: Card(
          child: Column(
            children: [
               SizedBox(
                height: 25,
              ),
              Text('$type',style: kTextStyle,),
              SizedBox(
                height: 25,
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: ktxtfieldstyle.copyWith(
                    hintText:
                        'Enter  Correct Name (Type or Company as specified )'),
                controller: ctrl,
              ),
              SizedBox(
                height: 25,
              ),
              OutlinedButton.icon(
                onPressed: () async {
                  try {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    print(type);
                    print(name);
                    await FirebaseFirestore.instance
                        .collection('$type')
                        .doc('$name')
                        .delete();
                    print('Record Deleted');
                    await storage.ref('$type/$name.png').delete();
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Deleted'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                ctrl.clear();
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } catch (e) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            e.toString(),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                ctrl.clear();
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                icon: Icon(Icons.delete_forever),
                label: Text('Delete Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
