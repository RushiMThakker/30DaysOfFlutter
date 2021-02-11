import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

// Day 11 we learnt about BuildContext, constraints and Widget tree, element tree and render tree
class HomePage extends StatelessWidget {
  final int days = 50;
  final String name = "Rushi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child:  Text("Hi. This is $name working on $days days of flutter\n This is day 3 of 30 Days"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
