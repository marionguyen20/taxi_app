import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 140, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset('ic_car_red.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Welcome Aboard!",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              Text(
                "Sign up with ICab in simple steps",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Name",
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset('ic_user.png'),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset('ic_phone.png'),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Container(
                        width: 50,
                        child: Image.asset('ic_mail.png'),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6))
                      )
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        obscureText: !_showPass,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Container(
                              width: 50,
                              child: Image.asset('ic_lock.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,
                                    width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    6))
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: showPass,
                          child: Text(
                            _showPass ? "HIDE" : "SHOW",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Padding (
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: SizedBox (
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton (
                    onPressed: () {},
                    child: Text (
                      "SIGN UP",
                      style: TextStyle (fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.lightBlueAccent,
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
                    text: "Already a User?  ",
                    style: TextStyle (fontSize: 16, color: Colors.grey),
                    children: <TextSpan> [
                      TextSpan (
                        text: "Login now",
                        style: TextStyle (fontSize: 16, color: Colors.blue),
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

  void showPass () {
      setState(() {
        _showPass = !_showPass;
      });
    }
  }

