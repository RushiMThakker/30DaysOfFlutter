import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;

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
          Text("Welcome $name",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(children: [
              TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter username", labelText: "Username"),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  }),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter password", labelText: "Password")),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    changedButton = true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, MyRoutes.HOME_ROUTE);
                },
                child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    child: changedButton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text("Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                    width: changedButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 8))),
              )
              /*
              ElevatedButton(
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.HOME_ROUTE);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ))*/
            ]),
          )
        ]),
      ),
    );
  }
}
