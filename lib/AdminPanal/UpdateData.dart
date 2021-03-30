import 'package:flutter/material.dart';
import 'package:material_supplier_app/Update/Delete%20Record/BrickUpdate.dart';
import 'package:material_supplier_app/Update/Delete%20Record/CementUpdate.dart';
import 'package:material_supplier_app/Update/Delete%20Record/GittiUpdate.dart';
import 'package:material_supplier_app/Update/Delete%20Record/IronUpdate.dart';
import 'package:material_supplier_app/Update/Delete%20Record/SandUpdate.dart';

class UpdatePanal extends StatelessWidget {
  static String id = 'Update Panal';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text('Update Data Panel'),
              Text('Every Field is Required otherwise it will be null in db',style: TextStyle(fontSize: 12),),
            ],
          ),
          backgroundColor: Colors.red,
          bottom: TabBar(
            indicatorColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(
                child: Text('Brick'),
              ),
              Tab(
                child: Text('Iron Rod'),
              ),
              Tab(
                child: Text('Cement'),
              ),
              Tab(
                child: Text('Gitti'),
              ),
              Tab(
                child: Text('Sand'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BrickUpdate(),
            IronUpdate(),
            CementUpdate(),
            GittiUpdate(),
            SandUpdate(),
          ],
        ),
      ),
    );
  }
}
