import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_supplier_app/AdminPanal/AdminPanal.dart';
import 'package:material_supplier_app/AdminPanal/UpdateData.dart';
import 'package:material_supplier_app/Screens/HomePage.dart';

import 'DeleteData.dart';

class OperationSelecterScreen extends StatelessWidget {
  static String id = 'Select Opeartion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AdminPanal.id);
              },
              icon: Icon(Icons.add_to_drive),
              label: Text('Add Data'),
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, UpdatePanal.id);
              },
              icon: Icon(Icons.update_outlined),
              label: Text('Update Data'),
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, DeletePanal.id);
              },
              icon: Icon(Icons.delete),
              label: Text('Delete Data'),
            ),
          ],
        ),
      ),
      floatingActionButton: OutlinedButton.icon(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamedAndRemoveUntil(context, HomePage.id ,(route) => false);
        },
        icon: Icon(
          Icons.logout,
          // color: Colors.white,
        ),
        label: Text(
          'Log Out',
          style: TextStyle(
              // color: Colors.white,
              ),
        ),
      ),
    );
  }
}
