import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Welcome",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter username", labelText: "Username"),
              ),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password")),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.HOME_ROUTE);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ))
            ]),
          )
        ]),
      ),
    );
  }
}
