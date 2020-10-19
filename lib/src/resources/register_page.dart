import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/auth_bloc.dart';
import 'package:taxi_app/src/resources/home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc = new AuthBloc();

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _phoneController = new TextEditingController();

  @override
  void dispose () {
    authBloc.dispose();
    super.dispose();
  }
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
                child: StreamBuilder (
                  stream: authBloc.nameStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _nameController,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error : null,
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
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.phoneStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _phoneController,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
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
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: StreamBuilder(
                  stream: authBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
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
                    );
                  }
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      StreamBuilder(
                        stream: authBloc.passStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _passController,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            obscureText: !_showPass,
                            decoration: InputDecoration(
                              errorText: snapshot.hasError ? snapshot.error : null,
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
                          );
                        }
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
                    onPressed: _onSignUpClick,
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

  _onSignUpClick () async {
    var isValid = authBloc.isValid(_nameController.text, _emailController.text,
        _passController.text, _phoneController.text);
    if (isValid) {
      authBloc.signUp(_emailController.text, _passController.text, _nameController.text, _phoneController.text, (){
        Navigator.push(context, MaterialPageRoute (builder: (context) => Homepage()));
      });
    }
  }

}

