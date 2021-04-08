import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.green[900],
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

//CONTACT US FIELDS DECORATION
inputTextDecoContact() {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green[600], width: 2.0)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green[300], width: 2.0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)),
  );
}

//TEXT INPUT DECORATION
inputTextDecoration(
    Icon prefixIcon, String hintText, GestureDetector suffixIcon) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
    hintText: hintText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green[600], width: 2.0)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green[300], width: 2.0)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0)),
  );
}
