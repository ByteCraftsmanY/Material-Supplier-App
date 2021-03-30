import 'package:flutter/cupertino.dart';
import 'package:material_supplier_app/Getting%20Data/BrickData.dart';
import 'package:material_supplier_app/Getting%20Data/CementData.dart';
import 'package:material_supplier_app/Getting%20Data/GittiData.dart';
import 'package:material_supplier_app/Getting%20Data/IronRodData.dart';
import 'package:material_supplier_app/Getting%20Data/SandData.dart';
import 'package:material_supplier_app/Materials/Brick.dart';
import 'package:material_supplier_app/Materials/Categary.dart';
import 'package:material_supplier_app/Materials/Cement.dart';
import 'package:material_supplier_app/Materials/IronRode.dart';
import 'package:material_supplier_app/Materials/Sand.dart';
import 'package:material_supplier_app/Materials/Gitti.dart';

class AvailableMaterials extends ChangeNotifier {
  Image banner = Image.asset(
    'assets/bck.jpg',
    fit: BoxFit.fill,
  );
  List<Categary> items = [
    Categary(
        img: AssetImage('assets/bricks.jpg'),
        type: 'Brick',
        data: BrickData.id),
    Categary(
        img: AssetImage('assets/cement.jpg'),
        type: 'Cement',
        data: CementData.id),
    Categary(
        img: AssetImage('assets/ironrod.jpg'),
        type: 'IronRod',
        data: IronRodData.id),
    Categary(
        img: AssetImage('assets/sand.jpg'), type: 'Sand', data: SandData.id),
    Categary(
        img: AssetImage('assets/stone-gitti.jpeg'),
        type: 'Gitti',
        data: GittiData.id),
  ];
  List<Brick> brics = [];
  List<Cement> cement = [];
  List<IronRods> bars = [];
  List<Gitti> stones = [];
  List<Sand> sand = [];
  void onChanged() {
    notifyListeners();
  }
}
