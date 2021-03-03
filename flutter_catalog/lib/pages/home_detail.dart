import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  const HomeDetail({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.uploadTime}".text.bold.xl2.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Add to cart".text.lg.make(),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(130, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.thumbnail))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              width: context.screenWidth,
              color: context.cardColor,
              child: Column(
                children: [
                  catalog.title.text.bold.xl2
                      .color(context.accentColor)
                      .make()
                      .p8(),
                  catalog.desc.text.lg
                      .textStyle(context.captionStyle)
                      .make()
                      .p16(),
                ],
              ).py32(),
            ),
          ))
        ]),
      ),
    );
  }
}
