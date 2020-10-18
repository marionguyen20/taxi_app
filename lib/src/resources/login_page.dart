import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container (
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView (
          child: Column (
            children: <Widget>[
              SizedBox (
                height: 140
              ),
              Image.asset('ic_car_green'),
              Padding (
                padding: const EdgeInsets.fromLTRB(0,40, 0, 6),
                child: Text (
                  "Welcome back",
                  style: TextStyle (fontSize: 22, color: Colors.black),
                ),
              ),
              Text (
                "Login to continue using ICab",
                style: TextStyle (fontSize: 18, color: Colors.black),
              ),
              Padding (
                padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
                child: TextField (
                  style: TextStyle (fontSize: 18, color: Colors.black),
                  decoration: InputDecoration (
                      labelText: "Email",
                      prefixIcon: Container (
                        width: 50,
                        child: Image.asset("ic_mail.png"),
                      ),
                    border: OutlineInputBorder (
                      borderSide:   BorderSide (color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(6))
                    )
                  ),
                ),
              ),
              TextField (
                style: TextStyle (fontSize: 18, color: Colors.black),
                obscureText: true,
                decoration: InputDecoration (
                  labelText: "Password",
                  prefixIcon: Container (
                    width: 50,
                    child: Image.asset("ic_phone.png"),
                  ),
                  border: OutlineInputBorder (
                    borderSide: BorderSide (color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(6))
                  ),
                ),
              ),
              Container (
                constraints: BoxConstraints.loose(Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: Padding (
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text (
                    "Forgot password?",
                    style: TextStyle (fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              Padding (
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox (
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton (
                    onPressed: () {},
                    child: Text (
                      "LOG IN",
                      style: TextStyle (fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder (
                      borderRadius: BorderRadius.all(Radius.circular(6))
                    ),
                  ),
                ),
              ),
              Padding (
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText (
                  text: TextSpan (
                    text: "New User?",
                    style: TextStyle (fontSize: 16, color: Colors.grey),
                    children: <TextSpan> [
                      TextSpan (
                        text: "Sign up for a new account",
                        style: TextStyle (fontSize: 16, color: Colors.blue)
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}