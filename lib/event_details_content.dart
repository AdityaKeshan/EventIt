import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event.dart';
import 'guest.dart';
import 'styleguide.dart';

class EventDetailsContent extends StatefulWidget {

  @override
  _EventDetailsContentState createState() => _EventDetailsContentState();
}

class _EventDetailsContentState extends State<EventDetailsContent> {
  var event,screenWidth;
  List<String> comm;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    event = Provider.of<Event>(context,listen: false);
    screenWidth = MediaQuery.of(context).size.width;
    comm=event.comments.split("|");
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Text(
                    "-",
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    event.location==null?"VIT":event.location,
                    style: eventLocationTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 180,
          ),


          Padding(
            padding: const EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: event.punchLine1,
                  style: punchLine1TextStyle,
                ),
                TextSpan(
                  text: event.punchLine2,
                  style: punchLine2TextStyle,
                ),
              ]),
            ),
          ),
          if (event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                event.description,
                style: eventLocationTextStyle,
              ),
            ),
          if (event.galleryImages!=null && event.galleryImages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
              child: Text(
                "GALLERY",
                style: guestTextStyle,
              ),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                if(event.galleryImages!=null)
                for (final galleryImagePath in event.galleryImages)
                  Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        galleryImagePath,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Comments:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            height: 900.0,
            child: ListView.builder(itemCount: comm.length,itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10.0),
                margin: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                height: 50,
                // color: Colors.white,

                child: Text(
                  comm[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },

            ),
          )

        ],
      ),
    );
  }
}
