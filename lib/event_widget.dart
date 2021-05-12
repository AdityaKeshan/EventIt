import 'package:flutter/material.dart';
import 'styleguide.dart';

import 'event.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              child: event.coverUrl==null? Image.asset(
               "assets/event_images/music_concert.jpeg",
                height: 150,
                fit: BoxFit.fitWidth,
              ):Image.network(event.coverUrl,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                event.location==null?"VIT":event.location,
                                style: eventLocationTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Text(
                  //     event.duration.toUpperCase(),
                  //     textAlign: TextAlign.right,
                  //     style: eventLocationTextStyle.copyWith(
                  //       fontWeight: FontWeight.w900,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.duration==null?"":event.duration.toUpperCase(),
                          textAlign: TextAlign.right,
                          style: eventLocationTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "₹"+(event.fees==null?"":event.fees),
                                style: eventLocationTextStyle.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.date==null?"":event.date,
                          textAlign: TextAlign.right,
                          style: eventLocationTextStyle.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Row(
                                children: [
                                  event.rating==null? SizedBox():Icon(Icons.star),
                                  Text(
                                    event.rating==null?"":event.rating,
                                    style: eventLocationTextStyle.copyWith(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
