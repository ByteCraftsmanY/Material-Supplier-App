import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:material_supplier_app/Pages/Loader.dart';
import 'package:material_supplier_app/Pages/SomethingWentWrong.dart';
import 'package:material_supplier_app/Routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Initilizar(),
  );
}

class Initilizar extends StatelessWidget {
  final Future<FirebaseApp> _ini = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ini,
      builder: (context, snapshot) {
        if (snapshot.hasError) return WentWrong();
        if (snapshot.connectionState == ConnectionState.done) return MyApp();
        return Loader();
      },
    );
  }
}
