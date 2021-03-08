import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
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
        child: Container(
          child: "Hi cart".text.make(),
          color: context.canvasColor,
        ),
      ),
    );
  }
}
