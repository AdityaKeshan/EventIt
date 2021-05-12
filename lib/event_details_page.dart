import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';
import 'event.dart';
import 'event_details_background.dart';
import 'event_details_content.dart';
import 'comments.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
      floatingActionButton: Data.adminData!=null?null: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return Expanded(
                  child: AlertDialog(
                    title: Text(
                        'Confirm Registration'), // To display the title it is optional
                    content: Text(
                        'Hi Aditya, do you want to register for '+event.title+' event for Rs. '+event.fees+'?'), // Message which will be pop up on the screen
                    // Action widget which will provide the user to acknowledge the choice
                    actions: [
                      FlatButton(
                        // FlatButton widget is used to make a text to work like a button
                        textColor: Colors.black,
                        onPressed:
                            () {}, // function used to perform after pressing the button
                        child: Text('NO'),
                      ),
                      FlatButton(
                        textColor: Colors.black,
                        onPressed: () {
                          //TODO: Add Database mechanism to update into events as well as our user's event list both online and offline
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
