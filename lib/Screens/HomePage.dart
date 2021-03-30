import 'package:flutter/material.dart';
import 'package:material_supplier_app/Components/MaterialHomeContainer.dart';
// import 'package:material_supplier_app/Getting%20Data/BrickData.dart';
import 'package:material_supplier_app/Providers/MaterialsProvider.dart';
import 'package:material_supplier_app/Screens/ContactScreen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AvailableMaterials>(
        builder: (context, value, child) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                flexibleSpace: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MyNameCard.id,
                    );
                  },
                  child: Container(
                    child: Align(
                      child: Text(
                        'Yadav Materials  ',
                        style: TextStyle(
                          backgroundColor: Colors.black26,
                          decorationColor: Colors.green,
                            fontSize: 40,
                            fontFamily: 'Lobster',
                            color: Colors.white),
                      ),
                      alignment: Alignment.bottomRight,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      // gradient: LinearGradient(
                      //   colors: [Colors.white, Colors.white],
                      //   begin: Alignment.bottomCenter,
                      //   end: Alignment.topRight,
                      //   // stops: [0.0, 1.0],
                      // ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/bck.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                expandedHeight: 150,
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, id) {
                  return InkWell(
                    child: MaterialConteiner(
                      img: value.items[id].img,
                      type: value.items[id].type,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, value.items[id].data);
                    },
                  );
                }, childCount: value.items.length),
              )
            ],
          );
        },
      ),
    );
  }
}

// SliverGrid(
//   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//     maxCrossAxisExtent: 4,
//     mainAxisExtent: 2,
//     crossAxisSpacing: 10,
//     mainAxisSpacing: 10,
//   ),
//   delegate: SliverChildBuilderDelegate(
//     (context, id) {
//       return Container(
//         height: 25,
//         width: 25,
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(
//         //     image: value.items[id].img,
//         //     fit: BoxFit.fill,
//         //   ),
//         // ),
//         child: Text('${value.items[id].type}'),
//       );
//     },
//     childCount: value.items.length,
//   ),
// ),
