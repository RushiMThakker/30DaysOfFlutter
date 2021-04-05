import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
      ),
      body: SafeArea(
        child: Column(children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ]),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(mutations: {RemoveMutation}, builder: (context, _) {
            return "\$${_cart.totalPrice}".text.xl4.color(context.accentColor).make();
          }),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet".text.make(),
              ));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    context.theme.buttonColor)),
            child: "Buy".text.color(context.accentColor).make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) {
              final Item item = _cart.items[index];
              return ListTile(
                leading: Icon(Icons.done),
                title: item.name.text.color(context.accentColor).make(),
                trailing: IconButton(
                    onPressed: () {
                      RemoveMutation(item);
                    }, icon: Icon(Icons.remove_circle_outline)),
              );
            });
  }
}