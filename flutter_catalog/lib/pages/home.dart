import 'package:flutter/material.dart';

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
          child: Text("Hi. This is $name working on $days days of flutter\n This is day 3 of 30 Days"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
