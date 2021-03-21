import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contact us",
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xff336633),
      ),
      body: Center(
        child: Text("contact us..."),
      ),
    );
  }
}
