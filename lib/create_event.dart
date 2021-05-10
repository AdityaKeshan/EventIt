import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({Key key}) : super(key: key);
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int _selectedIndex = 0;
  String title,description,date="Date",time="Time",fee,keywords;
  FirebaseAuth firebaseAuth;
  FirebaseDatabase database;
  DateTime selectedDate = DateTime.now();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        date=picked.day.toString()+"-"+picked.month.toString()+"-"+picked.year.toString();
      });
  }
  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay t=TimeOfDay.now();
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: t,

    );
    if (picked != null && picked != t)
      setState(() {
        t = picked;

        time=picked.hour.toString()+":"+picked.minute.toString();
      });
  }
  bool isValidFee(String a)
  {
    return true;
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    //widgets
  ];

  @override
  Widget build(BuildContext context) {
    database=FirebaseDatabase.instance;
    return Scaffold(
      backgroundColor: Color(0xff64C7EE),
      body: profileView(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
      ),
    );
  }

  Widget profileView() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(30, 25, 30, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Event details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(height: 14, width: 24)
            ],
          ),
        ),
        Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (text)
                                  {
                                    title=text;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Title',
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:
                                Border.all(width: 1.0, color: Colors.white70)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (text)
                                  {
                                    description=text;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Description',
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:
                                Border.all(width: 1.0, color: Colors.white70)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(readOnly: true,
                                  onTap: ()
                                  {
                                    _selectDate(context);

                                  },
                                  decoration: InputDecoration(
                                    hintText: date,
                                    alignLabelWithHint: true,

                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:
                                Border.all(width: 1.0, color: Colors.white70)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                 readOnly: true,
                                  onTap: ()
                                  {
                                    _selectTime(context);
                                  },
                                  decoration: InputDecoration(
                                    hintText: time,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:
                                Border.all(width: 1.0, color: Colors.white70)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (text)
                                  {
                                    fee=text;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Fee',
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:
                                Border.all(width: 1.0, color: Colors.white70)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                          child: Container(
                            height: 60,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (text)
                                  {
                                    keywords=text;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Keywords',
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border:
                                Border.all(width: 1.0, color: Colors.white70)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.image),
                        Text(
                          "Upload Cover Photo",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {
                      getImage();
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.grey,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async
                    {
                      if(isValidFee(fee))
                      {
                        //TODO: Store event info into Realtime Database
                        try {
                          int eventID=Random().nextInt(10000);
                          Map<String,String> val={'title':title,'description':description,'date':date,'time':time,'fee':fee,'keywords':keywords};

                          database.reference().child("/Events/$eventID").set(val);
                          Navigator.pop(context);
                        }
                        catch(e)
                        {

                        }
                      }
                      else
                      {
                        Fluttertoast.showToast(msg: "Invalid Event Details");
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.grey,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
