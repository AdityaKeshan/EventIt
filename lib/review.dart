import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Review extends StatefulWidget {
  final String title;
  const Review({Key key, this.title}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  TextEditingController td = new TextEditingController();
  FirebaseDatabase database;
  File _image;
  double rating = 3;
  final picker = ImagePicker();
  List<File> f = [];
  String comment = "";

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {
          f.add(_image);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    database = FirebaseDatabase.instance;
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 45.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.title == null ? " " : widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 40.0),
                  child: Text(
                    "Rating:",
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: RatingBarIndicator(
                    itemCount: 5,
                    rating: rating,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            rating = index + 1.0;
                          });
                        },
                        child: Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Text(
                    "Comments:",
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
                Container(
                  color: Colors.white38,
                  margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: td,
                    maxLines: 5,
                    onChanged: (text) {
                      comment = text;
                    },
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, style: BorderStyle.solid)),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                      hintText: 'Comments',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0, top: 30.0),
                      child: Text(
                        "Media:",
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, top: 30.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            style: ButtonStyle(),
                            onPressed: () {
                              getImage();
                              //TODO: AddGallery Picker with listView to display images
                            },
                            child: Text(
                              "Upload Media",
                              style: TextStyle(fontSize: 20.0),
                            )),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext build, int index) {
                      return Container(
                        margin:
                            EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                        child: Image.file(
                          File(f[index].path),
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    itemCount: f.length,
                  ),
                ),
                // Container(
                //
                //   margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                //   child: Image.asset('assets/images/cc.jpeg',fit:BoxFit.fill ,),
                // ),
                // Container(
                //
                //   margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                //   child: Image.asset('assets/images/cc.jpeg',fit:BoxFit.fill ,),
                // ),
                // Container(
                //
                //   margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                //   child: Image.asset('assets/images/cc.jpeg',fit:BoxFit.fill ,),
                // )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () async {
                    String eventId = "";
                    var b = database.reference().child("Events");
                    // Todo: Comment ka portion add
                    b.once().then((DataSnapshot value) {
                      print(value.key);
                      Map<dynamic, dynamic> m1 = value.value;
                      print(m1);
                      for (var a in m1.keys) {
                        print(a);
                        var c = m1[a];
                        String k = c['title'];
                        if (k == widget.title) {
                          eventId = a.toString();
                          var d = c['rating'];
                          int j = (double.parse(d.toString())).ceil() +
                              rating.ceil();
                          j = (j / 2).ceil() - 1;
                          d = j;
                          c['rating'] = d;
                          if(!(comment =="")) {
                            c['comments'] =
                                c['comments'] + " | " + comment ;
                          }
                          b.set(m1);
                          m1[a] = c;
                          print(m1);
                          FirebaseStorage storage = FirebaseStorage.instance;
                          try {
                            print("Abcd:"+eventId);
                            DateTime dt=new DateTime.now();
                            storage.ref("images/$eventId/"+dt.toString()).putFile(f[0]);

                          } on FirebaseException catch (e) {
// e.g, e.code == 'canceled'
                            print("Error");
                          }
                          break;
                        }
                      }
                    });

                    Fluttertoast.showToast(msg: "Thank you for your review");
                    Navigator.pop(context);
                    // TODO : Adding Navigator to go back to profile page with pop up-successful and update to firebase
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20.0),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
