import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event.dart';
import 'guest.dart';
import 'styleguide.dart';

class NewsDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

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
                    event.location,
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
          // Padding(
          //   padding: const EdgeInsets.only(left: 16.0),
          //   child: Text(
          //     "GUESTS",
          //     style: guestTextStyle,
          //   ),
          // ),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: <Widget>[
          //       for (final guest in guests)
          //         Padding(
          //           padding: const EdgeInsets.all(8),
          //           child: ClipOval(
          //             child: Image.asset(
          //               guest.imagePath,
          //               width: 90,
          //               height: 90,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //     ],
          //   ),
          // ),

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
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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

        ],
      ),
    );
  }
}
