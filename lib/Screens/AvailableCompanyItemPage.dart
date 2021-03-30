import 'package:flutter/material.dart';
import 'package:material_supplier_app/Providers/MaterialsProvider.dart';
import 'package:provider/provider.dart';

class AvailableCompanyItem extends StatelessWidget {
  final int i;

  const AvailableCompanyItem({Key key, this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AvailableCompanyItem args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Consumer<AvailableMaterials>(builder: (context, value, child) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: value.items[args.i].img,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    child: Text('Hello'),
                  );
                },
                childCount: 4,
              ),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            )
          ],
        );
      }),
    );
  }
}
