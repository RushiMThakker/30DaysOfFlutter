import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          child: Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogItem(catalog: catalog)),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetail(catalog: catalog))),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
        children: [
          CatalogImage(
            image: catalog.thumbnail,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.title.text.bold.lg.color(context.accentColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mOnly(right: 16),
                children: [
                  "\$${catalog.uploadTime}".text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: () {},
                    child: "Add to cart".text.normal.make(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  )
                ],
              )
            ],
          ))
        ],
    )).color(context.cardColor).roundedSM.square(150).make().py16();
  }
}
