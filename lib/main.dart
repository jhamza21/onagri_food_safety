import 'package:flutter/material.dart';
import 'package:onagri/views/news_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ONAGRI',
      theme: ThemeData(
        primaryColor: Color(0xffff6101),
      ),
      home: NewsPage(),
    );
  }
}
