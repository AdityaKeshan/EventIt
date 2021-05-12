import 'package:flutter/material.dart';

import 'data.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({Key key}) : super(key: key);

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {

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
              child: ListView.builder(itemCount: Data.uRLS.length,itemBuilder: (BuildContext context,index)
              {
                return Image.network(Data.uRLS[index]);
              }),
            ),
          )
        ],
      ),
    );
  }
}
