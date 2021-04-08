import 'package:flutter/material.dart';
import 'package:onagri/helper/constants.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String email, name, message;
  @override
  Widget build(BuildContext context) {
    Widget showEmailInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(height: 10.0),
            new TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputTextDecoContact(),
              onChanged: (value) => setState(() {
                email = value.trim();
              }),
            ),
          ],
        ),
      );
    }

    Widget showNameInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nom',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(height: 10.0),
            new TextFormField(
              keyboardType: TextInputType.text,
              decoration: inputTextDecoContact(),
              onChanged: (value) => setState(() {
                name = value.trim();
              }),
            ),
          ],
        ),
      );
    }

    Widget showMessageInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            SizedBox(height: 10.0),
            new TextFormField(
              maxLines: 8,
              keyboardType: TextInputType.text,
              decoration: inputTextDecoContact(),
              onChanged: (value) => setState(() {
                message = value.trim();
              }),
            ),
          ],
        ),
      );
    }

    Widget showImage() {
      return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/images/email.png'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Nous contacter",
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xff336633),
      ),
      body: Column(
        children: [
          showImage(),
          showNameInput(),
          showEmailInput(),
          showMessageInput(),
        ],
      ),
    );
  }
}
