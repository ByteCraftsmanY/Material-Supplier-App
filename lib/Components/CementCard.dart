import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:material_supplier_app/Materials/Cement.dart';
import 'package:material_supplier_app/Utility/Constants.dart';

class CementCard extends StatelessWidget {
  final Cement item;

  const CementCard({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      background: Image(
        image: item.img,
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white70,
      title: Text(
        item.company,
        style:
            kTextStyle.copyWith(fontSize: 50, backgroundColor: Colors.white24),
      ),
      children: [
        Table(
          border: TableBorder(
            right: BorderSide(
                width: 1, color: Colors.black87, style: BorderStyle.solid),
            verticalInside: BorderSide(
                width: 1, color: Colors.black87, style: BorderStyle.solid),
            horizontalInside: BorderSide(
                width: 1, color: Colors.black87, style: BorderStyle.solid),
          ),
          children: [
            TableRow(
              children: [
                Text(
                  'Company',
                  style: kTextStyle,
                ),
                Text(item.company, style: kTextStyle),
              ],
            ),
            TableRow(children: [
              Text('Weight/Bag', style: kTextStyle),
              Text('${item.weight}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Price Per Bag', style: kTextStyle),
              Text('${item.price}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Delivery Charge', style: kTextStyle),
              Text('${item.deliveryCharge}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Status', style: kTextStyle),
              Text(item.status, style: kTextStyle),
            ]),
          ],
        ),
      ],
    );
  }
}
