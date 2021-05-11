import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event.dart';
import 'event_details_background.dart';
import 'event_details_content.dart';
import 'comments.dart';
import 'newsdetailscontent.dart';

class NewsDetailsPage extends StatelessWidget {
  final Event event;

  const NewsDetailsPage({Key key, this.event}) : super(key: key);

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
            NewsDetailsContent(),
          ],
        ),
      ),

      // bottomSheet: event.list,
    );
  }
}
