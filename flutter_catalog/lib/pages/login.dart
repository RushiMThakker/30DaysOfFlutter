import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HOME_ROUTE);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
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
                  color: context.accentColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Form(
                key: _formKey,
                child: Column(children: [
                TextFormField(
                decoration: InputDecoration(
                hintText: "Enter username", labelText: "Username"),
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                }),
          TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter password", labelText: "Password"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter password";
                } else if (value.length < 6) {
                  return "Password should be atleast 6 characters long";
                }
                return null;
              }),
          SizedBox(
            height: 40,
          ),
          Material(
              color: context.theme.buttonColor,
              borderRadius: BorderRadius.circular(changedButton ? 50 : 8),
              child: InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    child: changedButton
                        ? Icon(Icons.done, color: context.cardColor)
                        : Text("Login",
                        style: TextStyle(
                            color: context.accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    width: changedButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center),
              ))
        ]),
      ),
    )])
    ,
    )
    ,
    );
  }
}
