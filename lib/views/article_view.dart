import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  final String articleName;
  ArticleView({@required this.articleName});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.articleName,
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
        child: Text("Article info..."),
      ),
    );
  }
}
