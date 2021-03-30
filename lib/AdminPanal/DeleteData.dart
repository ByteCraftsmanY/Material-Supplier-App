import 'package:flutter/material.dart';
import 'package:material_supplier_app/Update/Delete%20Record/DeleteRecord.dart';

class DeletePanal extends StatelessWidget {
  static String id = 'Delete Panal';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Delete Data Panal'),
          backgroundColor: Colors.red,
          bottom: TabBar(
            overlayColor: MaterialStateProperty.resolveWith(
              (states) => Colors.blueGrey[900],
            ),
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
            DataDeleteCard(type: 'Bricks'),
            DataDeleteCard(type: 'IronRode'),
            DataDeleteCard(type: 'Cement'),
            DataDeleteCard(type: 'Gitti'),
            DataDeleteCard(type: 'Sand'),
            // IronRodeDeleteCard(),
            // CementDataDeleteCard(),
            // GittiDataDeleteCard(),
            // SandDataDeleteCard(),
          ],
        ),
      ),
    );
  }
}
