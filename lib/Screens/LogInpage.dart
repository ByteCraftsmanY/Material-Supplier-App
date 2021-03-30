import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:material_supplier_app/AdminPanal/AdminPanal.dart';
import 'package:material_supplier_app/AdminPanal/OperationSelecter.dart';
import 'package:material_supplier_app/Providers/NameCardProvider.dart';
import 'package:material_supplier_app/Utility/Constants.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  static String id = 'LogIN Screen';
  @override
  Widget build(BuildContext context) {
    String id;
    String pass;
    var idc = TextEditingController();
    var passc = TextEditingController();
    return Scaffold(
      // backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 40,
            margin: EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Hero(
                    tag: 'PIC',
                    child: Image(
                      image: Provider.of<MyContactProvider>(context).img,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: idc,
                    keyboardType: TextInputType.emailAddress,
                    decoration: ktxtfieldstyle.copyWith(
                      hintText: 'Enter ID',
                    ),
                    onChanged: (value) {
                      id = value;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: passc,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: ktxtfieldstyle.copyWith(
                      hintText: 'Enter Passward',
                    ),
                    onChanged: (value) {
                      pass = value;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  OutlinedButton(
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
                          await _auth.signInWithEmailAndPassword(
                              email: id, password: pass);
                          await Navigator.pushNamed(
                              context, OperationSelecterScreen.id);
                          Navigator.pop(context);
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
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          print(e);
                        }
                      },
                      child: Text('Log in'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
