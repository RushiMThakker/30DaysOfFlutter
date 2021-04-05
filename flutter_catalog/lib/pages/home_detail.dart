import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
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
            "\$${catalog.price}".text.bold.xl2.make(),
              AddToCart(catalog: catalog).wh(130, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
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
                  catalog.name.text.bold.xl2
                      .color(context.accentColor)
                      .make()
                      .p8(),
                  catalog.desc.text.lg
                      .textStyle(context.captionStyle)
                      .make()
                      .p16(),
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere eleifend hendrerit. Nam vel justo tellus. Quisque ut aliquet purus. Aliquam at purus vitae arcu mollis pretium. Nullam congue turpis at mauris blandit hendrerit id a lacus. Aliquam vel ex enim. Phasellus vulputate quis felis vel pretium. Pellentesque sit amet.".text.make()
                ],
              ).py32(),
            ),
          ))
        ]),
      ),
    );
  }
}
