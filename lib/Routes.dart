import 'package:flutter/material.dart';
import 'package:material_supplier_app/AdminPanal/AdminPanal.dart';
import 'package:material_supplier_app/AdminPanal/DeleteData.dart';
import 'package:material_supplier_app/AdminPanal/OperationSelecter.dart';
import 'package:material_supplier_app/AdminPanal/UpdateData.dart';
import 'package:material_supplier_app/Getting%20Data/BrickData.dart';
import 'package:material_supplier_app/Getting%20Data/CementData.dart';
import 'package:material_supplier_app/Getting%20Data/GittiData.dart';
import 'package:material_supplier_app/Getting%20Data/IronRodData.dart';
import 'package:material_supplier_app/Getting%20Data/SandData.dart';
// import 'package:material_supplier_app/Materials/Cement.dart';
import 'package:material_supplier_app/Providers/MaterialsProvider.dart';
import 'package:material_supplier_app/Providers/NameCardProvider.dart';
import 'package:material_supplier_app/Screens/ContactScreen.dart';
import 'package:material_supplier_app/Screens/HomePage.dart';
import 'package:material_supplier_app/Screens/LogInpage.dart';
import 'package:material_supplier_app/Screens/Ragistration.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyContactProvider()),
        ChangeNotifierProvider(create: (context) => AvailableMaterials()),
      ],
      child: MaterialApp(
        initialRoute: HomePage.id,
        routes: {
          LogInPage.id: (context) => LogInPage(),
          RagistrationPage.id: (context) => RagistrationPage(),
          MyNameCard.id: (context) => MyNameCard(),
          HomePage.id: (context) => HomePage(),
          AdminPanal.id: (context) => AdminPanal(),
          BrickData.id: (context) => BrickData(),
          CementData.id: (context) => CementData(),
          GittiData.id: (context) => GittiData(),
          IronRodData.id: (context) => IronRodData(),
          SandData.id: (context) => SandData(),
          DeletePanal.id: (context) => DeletePanal(),
          OperationSelecterScreen.id: (context) => OperationSelecterScreen(),
          UpdatePanal.id: (context) => UpdatePanal(),
        },
      ),
    );
  }
}
