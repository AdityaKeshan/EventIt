import 'package:eventit/app_state.dart';
import 'package:eventit/styleguide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'event.dart';
import 'event_details_page.dart';
import 'event_widget.dart';
import 'home_page_background.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1;
  List<Event> ev = [];
  String keyword;
  bool visibility = true;
  final List<Widget> _widgetOptions = <Widget>[
    //widgets
  ];
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        Navigator.popAndPushNamed(context, '/profile');
      } else if (index == 0) {
        Navigator.popAndPushNamed(context, '/home');
      } else if (index == 1) {
      } else {
        Navigator.popAndPushNamed(context, '/news');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePageBackground(
            screenHeight: MediaQuery.of(context).size.height,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "COLLEGE EVENTS",
                          style: fadedTextStyle,
                        ),
                        Spacer(),
                        Icon(
                          Icons.person_outline,
                          color: Color(0x99FFFFFF),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      "How You Doing?",
                      style: whiteHeadingTextStyle,
                    ),
                  ),
                  //TODO: Add Search bar here
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) {
                        keyword = text;
                      },
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            Visibility(
                                visible: visibility,
                                child: CircularProgressIndicator());
                            await Data()
                                .getEvent(keyword)
                                .then((List<Event> value) => {
                                      setState(() {
                                        ev = value;
                                        visibility = false;
                                      })
                                    });
                          },
                          child: Icon(Icons.search),
                        ),
                        hintText: 'Search here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 600.0,
                      child: ListView.builder(
                          itemCount: ev.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EventDetailsPage(event: ev[index]),
                                    ),
                                  );
                                },
                                child: EventWidget(
                                  event: ev[index],
                                ));
                          }),
                    ), //TODO:ADD EVENTS,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
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
}
