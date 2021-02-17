import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        print("${item.title} pressed");
      },
      leading: Image.network(item.thumbnail),
      title: Text(item.title),
      subtitle: Text(
        '${item.desc.substring(0, 30)}...',
      ),
      trailing: Text(item.creator,
          textScaleFactor: 1.2,
          style:
              TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold)),
    ));
  }
}
