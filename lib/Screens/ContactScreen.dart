import 'package:flutter/material.dart';
// import 'package:material_supplier_app/AdminPanal/AdminPanal.dart';
import 'package:material_supplier_app/Providers/NameCardProvider.dart';
import 'package:material_supplier_app/Screens/LogInpage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyNameCard extends StatelessWidget {
  static String id = 'Contact Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MyContactProvider>(
        builder: (context, value, child) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      // color: value.top,
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'PIC',
                        child: GestureDetector(
                          onLongPress: () {
                            Navigator.pushNamed(context, LogInPage.id);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: value.img,
                            radius: 80,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        value.name,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lobster',
                          letterSpacing: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: value.bottom,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(20),
                          child: ListTile(
                            // dense: true,
                            contentPadding: EdgeInsets.all(20),
                            focusColor: Colors.yellow,
                            enableFeedback: true,
                            enabled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hoverColor: Colors.grey,
                            // selected: true,
                            title: Text(
                              value.phone,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                            leading: Icon(
                              Icons.phone,
                              color: Colors.green,
                              size: 30,
                            ),
                            onTap: () => launch('tel:${value.phone}'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontFamily: 'Lobster'),
                      ),
                      //     SizedBox(
                      //   height: 15,
                      // ),
                      Divider(
                        indent: 160.0,
                        endIndent: 160.0,
                        height: 20,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value.address,
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'Lobster'),
                          ),
                          // InkWell(
                          //   child: Icon(
                          //     Icons.phone,
                          //     color: Colors.green,
                          //   ),
                          //   onTap: () => launch('tel:${value.phone}'),
                          // ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          // InkWell(
                          //   child: Icon(
                          //     Icons.message,
                          //     color: Colors.green,
                          //   ),
                          //   onTap: () => launch('sms:${value.phone}'),
                          // ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          // InkWell(
                          //   child: Icon(
                          //     Icons.location_pin,
                          //     color: Colors.yellow,
                          //   ),
                          //   onTap: () => launch(
                          //       'comgooglemaps://?center=${value.lat},${value.lng}'),
                          // ),
                          // SizedBox(
                          //   width: 20,
                          // ),
                          // InkWell(
                          //   child: Icon(
                          //     Icons.mail,
                          //     color: Colors.red,
                          //   ),
                          //   onTap: () => launch('mailto:${value.email}'),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
