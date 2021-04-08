import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "A propos",
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xff336633),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.share,
              ))
        ],
      ),
      body: Center(
        child: Text("..."),
      ),
    );
  }
}
