import 'package:flutter/material.dart';
import 'package:onagri/views/about_us.dart';
import 'package:onagri/views/faq.dart';
import 'package:onagri/views/home.dart';
import 'package:onagri/views/contact_us.dart';
import 'package:onagri/views/indicators/index.dart';

// ignore: non_constant_identifier_names
Widget MyDrawer(context) {
  return SafeArea(
    child: Drawer(
      elevation: 0,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/drawer_bg.jpg'))),
            child: SizedBox.shrink(),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Accueil',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }),
          ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text(
                'Indicateurs',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Indicators()));
              }),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: Text(
              'Paramètres',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contact_support_outlined),
            title: Text('A propos'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text('FAQ'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Faq()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail_outlined),
            title: Text('Nous contacter'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
        ],
      ),
    ),
  );
}

waitingScreen() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff336633)),
    ),
  );
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content;

  NewsTile({
    this.imgUrl,
    this.desc,
    @required this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ArticleView(
        //               articleName: title,
        //             )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        "assets/images/" + imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
