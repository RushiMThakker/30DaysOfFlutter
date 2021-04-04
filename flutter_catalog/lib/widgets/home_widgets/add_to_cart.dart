
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({
    Key key,
    @required this.catalog,
  }) : super(key: key);

  final Item catalog;

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel.cartModel;

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        final _catalog = CatalogModel();
        _cart.catalog = _catalog;
        isInCart=isInCart.toggle();
        isInCart?_cart.add(widget.catalog):_cart.remove(widget.catalog);
        this.setState(() {});
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
    );
  }
}