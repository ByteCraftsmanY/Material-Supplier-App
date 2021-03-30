import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
// import 'package:material_supplier_app/Components/ImageConteiner.dart';
import 'package:material_supplier_app/Materials/Brick.dart';
import 'package:material_supplier_app/Utility/Constants.dart';

class BrickCard extends StatelessWidget {
  final Brick item;

  const BrickCard({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(item.company);
    return ExpansionCard(
      background: Image(
        image: item.img,
        fit: BoxFit.fill,
      ),
      backgroundColor: Colors.white60,
      title: Text(
        item.company,
        style:
            kTextStyle.copyWith(fontSize: 50, backgroundColor: Colors.white60),
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
                  'Mark',
                  style: kTextStyle,
                ),
                Text(item.company, style: kTextStyle),
              ],
            ),
            TableRow(children: [
              Text('Length', style: kTextStyle),
              Text('${item.length}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Width', style: kTextStyle),
              Text('${item.width}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Heigth', style: kTextStyle),
              Text('${item.height}', style: kTextStyle)
            ]),
            TableRow(children: [
              Text('Status', style: kTextStyle),
              Text(item.status, style: kTextStyle),
            ]),
            TableRow(
              children: [
                Text('Price of 2000 brick', style: kTextStyle),
                Text('${item.priceof_2000}', style: kTextStyle),
              ],
            ),
            TableRow(
              children: [
                Text('Price of 6000 brick ', style: kTextStyle),
                Text('${item.priceof_6000}', style: kTextStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
