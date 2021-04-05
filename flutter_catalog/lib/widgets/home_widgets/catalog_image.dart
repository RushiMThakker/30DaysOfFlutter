import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image
        .network(this.image)
        .box
        .roundedSM
        .p8
        .color(context.canvasColor)
        .size(50, 100)
        .make()
        .p16()
        .wPCT(context: context, widthPCT: !context.isMobile?20:40);
  }
}