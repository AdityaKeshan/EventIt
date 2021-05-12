import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'event.dart' as e;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'event_details_background.dart';
import 'event_details_content.dart';
import 'comments.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventDetailsPage extends StatefulWidget {
  final e.Event event;
  final FirebaseDatabase database;

  const EventDetailsPage({Key key, this.event, this.database})
      : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Provider<e.Event>.value(
        value: widget.event,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
      floatingActionButton: Data.adminData != null
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
                showDialog<void>(

                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                        child: AlertDialog(
                          title: Text(
                              'Confirm Registration'), // To display the title it is optional
                          content: Text('Hi Aditya, do you want to register for ' +
                              widget.event.title +
                              ' event for Rs. ' +
                              widget.event.fees +
                              '?'), // Message which will be pop up on the screen
                          // Action widget which will provide the user to acknowledge the choice
                          actions: [
                            FlatButton(
                              // FlatButton widget is used to make a text to work like a button
                              textColor: Colors.black,
                              onPressed:
                                  () {
                                    Navigator.of(context, rootNavigator: true).pop('dialog');
                                  }, // function used to perform after pressing the button
                              child: Text('NO'),
                            ),
                            FlatButton(
                              textColor: Colors.black,
                              onPressed: ()  {
                                //TODO: Add PAyment faculites like raxorpay or paytm
                                if (int.parse(widget.event.fees)==0) {
                                  String eventsup = Data.userData.events +
                                      " | " +
                                      widget.event.title;
                                  Data.userData.events=eventsup;
                                  Future<SharedPreferences> pref=  SharedPreferences.getInstance();
                                  pref.then((value) => value.setString("User", jsonEncode(Data.userData)));
                                  setState(() {
                                    Data.events.add(widget.event.title);

                                  });
                                  FirebaseDatabase database=FirebaseDatabase.instance;
                                  database
                                      .reference()
                                      .child("User/" +
                                          Data.userData.reg +
                                          "/events")
                                      .set(eventsup);
                                  Fluttertoast.showToast(
                                      msg: "Registration is a sucess");
                                  Navigator.of(context, rootNavigator: true).pop('dialog');
                                } else {
                                  var _razorpay = Razorpay();

                                  var options = {
                                    'key': 'rzp_test_PMhu4UofSNJ96p',
                                    'amount': int.parse(widget.event.fees)*100, //in the smallest currency sub-unit.
                                    'name': 'Event It.', // Generate order_id using Orders API
                                    'description': widget.event.title,
                                    'timeout': 60, // in seconds
                                    'prefill': {
                                      'contact': '8820130888',
                                      'email': 'adityakeshan2409@gmail.com'
                                    },
                                    'external':{
                                      'wallets':['paytm']
                                    }
                                  };
                                  _razorpay.open(options);
                                  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                          () {
                                        String eventsup = Data.userData.events +
                                            " | " +
                                            widget.event.title;
                                        setState(() {
                                          Data.userData.events = eventsup;
                                        });
                                        _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                                () {
                                              Fluttertoast.showToast(
                                                  msg: "Try Again Later");
                                            });
                                    widget.database
                                        .reference()
                                        .child("User/" +
                                            Data.userData.reg +
                                            "/events")
                                        .set(eventsup);
                                    Navigator.pushNamed(
                                        context, '/paymentsuccess');
                                  });

                                }
                              },
                              child: Text('YES'),
                            ),
                          ],
                        ),
                      );
                    });
              },
              label: const Text('Register'),
              icon: const Icon(Icons.thumb_up),
              backgroundColor: Colors.pink,
            ),
      // bottomSheet: event.list,
    );
  }
}
