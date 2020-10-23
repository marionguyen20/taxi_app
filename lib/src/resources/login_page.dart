import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/app.dart';
import 'package:taxi_app/src/resources/Dialog/loading_dialog.dart';
import 'package:taxi_app/src/resources/Dialog/msg_dialog.dart';
import 'package:taxi_app/src/resources/home_page.dart';
import 'package:taxi_app/src/resources/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _showPass = false;
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

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
              Image.asset('ic_car_green.png'),
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
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: TextField (
                  style: TextStyle (fontSize: 18, color: Colors.black),
                  controller: _emailController,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Stack (
                  alignment: AlignmentDirectional.centerEnd,
                  children: <Widget>[
                    TextField (
                      style: TextStyle (fontSize: 18, color: Colors.black),
                      obscureText: !_showPass,
                      controller: _passController,
                      decoration: InputDecoration (
                        labelText: "Password",
                        prefixIcon: Container (
                          width: 50,
                          child: Image.asset("ic_lock.png"),
                        ),
                        border: OutlineInputBorder (
                            borderSide: BorderSide (color: Colors.black, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(6))
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector (
                        onTap: showPass,
                        child: Text (
                          _showPass ? "HIDE" : "SHOW",
                          style: TextStyle (fontSize: 14, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                )

              ),
              Container (
                constraints: BoxConstraints.loose(Size(double.infinity, 40)),
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
                    onPressed: _onLoginClick,
                    child: Text (
                      "LOG IN",
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
                    text: "New User?  ",
                    style: TextStyle (fontSize: 16, color: Colors.grey),
                    children: <TextSpan> [
                      TextSpan (
                        recognizer: TapGestureRecognizer ()
                          ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute (
                                builder: (context) => RegisterPage ()));},
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

 void showPass () {
  setState(() {
    _showPass = ! _showPass;
  });
  }
 void _onLoginClick () {
    String email = _emailController.text.trim();
    String pass = _passController.text;
    var authBlock = MyApp.of(context).authBloc;
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    authBlock.signIn(email, pass, () {
      LoadingDialog.hideLoadingDialog(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, "Sign in", msg);
    });
 }
}
