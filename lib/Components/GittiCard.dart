import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:material_supplier_app/Materials/Gitti.dart';
import 'package:material_supplier_app/Utility/Constants.dart';

class GittiCard extends StatelessWidget {
  final Gitti item;

  const GittiCard({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionCard(
      background: Image(
        image: item.img,
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white70,
      title: Text(
        item.type,
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
                  'Type',
                  style: kTextStyle,
                ),
                Text(item.type, style: kTextStyle),
              ],
            ),
            TableRow(children: [
              Text('Price of 1 Trolleys', style: kTextStyle),
              Text('${item.price1t}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Price of 6 wheeler Hyva', style: kTextStyle),
              Text('${item.price6w}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Price of 10 wheeler Hyva', style: kTextStyle),
              Text('${item.price10w}', style: kTextStyle)
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
