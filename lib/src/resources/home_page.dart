import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Center (
          child: Text (
            "Home page"
          ),
        ),
      ),
    );
  }
}