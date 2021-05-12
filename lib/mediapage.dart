import 'package:flutter/material.dart';

import 'data.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({Key key}) : super(key: key);

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  List<String> URLS=[];
  @override
  Widget build(BuildContext context) {
    setState(() {
      URLS=Data.uRLS;
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/signupback.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
            child: Container(
              height: MediaQuery. of(context). size. height,
              child: ListView.builder(itemCount: URLS.length,itemBuilder: (BuildContext context,index)
              {
                return Padding(padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),child: Image.network(URLS[index]));
              }),
            ),
          )
        ],
      ),
    );
  }
}
