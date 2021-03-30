import 'package:flutter/material.dart';
import 'package:material_supplier_app/Material%20Cards/Cement.dart';
import 'package:material_supplier_app/Material%20Cards/Gitti.dart';
import 'package:material_supplier_app/Material%20Cards/IronRodCard.dart';
import 'package:material_supplier_app/Material%20Cards/Sand.dart';
import 'package:material_supplier_app/Material%20Cards/brickcard.dart';

class AdminPanal extends StatelessWidget {
  static String id = 'Admin Panal';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Data Panal'),
          backgroundColor: Colors.blueGrey,
          bottom: TabBar(
            overlayColor: MaterialStateProperty.resolveWith((states) => Colors.blueGrey[900],),
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
            BrickDataCard(),
            IronRodeCard(),
            CementDataCard(),
            GittiDataCard(),
            SandDataCard(),
          ],
        ),
      ),
    );
  }
}

// Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () async {
//                 try {
//                   var temp =
//                       await ImagePicker().getImage(source: ImageSource.gallery);
//                   print(temp.path);
//                   img = File(temp.path);
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               icon: Icon(Icons.cloud_upload_outlined),
//             ),
//             OutlinedButton(
//                 onPressed: () async {
//                   try {
//                     await storage.ref('img.png').putFile(img);
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 child: Text('ui'))
//           ],
//         ),
//       ),
//       floatingActionButton: PopupMenuButton(
//         itemBuilder: (BuildContext context) => <PopupMenuItem<Widget>>[
//           PopupMenuItem(
//             child: buildInkWell(),
//           ),

//         ],
//       ),

// File img;
//     String folder;
//     String imgname;
//     firebase_storage.FirebaseStorage storage =
//         firebase_storage.FirebaseStorage.instance;
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 OutlinedButton(
//                   onPressed: () async {
//                     try {
//                       var temp = await ImagePicker()
//                           .getImage(source: ImageSource.gallery);
//                       img = File(temp.path);
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Image.file(img),
//                             actions: [
//                               OutlinedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('ok'),
//                               )
//                             ],
//                           );
//                         },
//                       );
//                       print(temp.path);
//                     } catch (e) {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text(
//                               e.toString(),
//                             ),
//                             actions: [
//                               OutlinedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('ok'),
//                               )
//                             ],
//                           );
//                         },
//                       );
//                       print(e);
//                     }
//                   },
//                   child: Text('Select File from galary'),
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 Text('Select File from camera'),
//               ],
//             ),
//             TextField(
//               onChanged: (value) {
//                 imgname = value;
//               },
//             ),
//             OutlinedButton(
//               onPressed: () async {
//                 try {
//                   if (folder == null) return;
//                   await storage
//                       .ref('$folder/$imgname.png')
//                       .putFile(img);
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               child: Text('Upload'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 var url =
//                     await storage.ref('$folder/$imgname.png').getDownloadURL();
//                 print(url);
//               },
//               child: Text('h'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: ListView.builder(
//                   itemBuilder: (context, index) {
//                     String temp = Provider.of<AvailableMaterials>(context)
//                         .items[index]
//                         .type;
//                     var icon = Provider.of<AvailableMaterials>(context)
//                         .items[index]
//                         .img;
//                     return ListTile(
//                       leading: Image(
//                         image: icon,
//                       ),
//                       contentPadding: EdgeInsets.all(20),
//                       hoverColor: Colors.lightBlue,
//                       title: Text(temp),
//                       onTap: () {
//                         folder = temp;
//                         // print(folder);
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                   itemCount:
//                       Provider.of<AvailableMaterials>(context).items.length,
//                 ),
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
