import 'package:eventit/data.dart';
import 'package:flutter/material.dart';
import 'NewsDetailsPage.dart';
import 'create_event.dart';
import 'category.dart';
import 'event.dart';
import 'styleguide.dart';
import 'event_details_page.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'category_widget.dart';
import 'event_widget.dart';
import 'home_page_background.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';


class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  SearchBar searchBar;
  int _selectedIndex = 2;
  final List<Widget> _widgetOptions = <Widget>[
    //widgets
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index==3) {
        Navigator.popAndPushNamed(context,'/profile');
      }
      else if(index==0)
      {
        Navigator.popAndPushNamed(context,'/home');
      }
      else if(index==1)
      {
        Navigator.popAndPushNamed(context,'/search');
      }
      else
      {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
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
                        "News",
                        style: whiteHeadingTextStyle,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //TODO:Remove this Consumer widget add listView builder and add news in data activity make the call
                        child: Expanded(
                        child: Container(
                          height: 700.0,
                          child: ListView.builder(itemCount:Data.newsData.length,itemBuilder: (BuildContext builder,index){
                            return GestureDetector(child: EventWidget(event:Data.newsData[index]),onTap: ()
                              {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewsDetailsPage(event: Data.newsData[index]),
                                  ),
                                );
                              },);

                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

// class NewsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ChangeNotifierProvider<AppState>(
//         create: (_) => AppState(),
//         child: Stack(
//           children: <Widget>[
//             NewsPageBackground(
//               screenHeight: MediaQuery.of(context).size.height,
//             ),
//             SafeArea(
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                       child: Row(
//                         children: <Widget>[
//                           Text(
//                             "COLLEGE EVENTS",
//                             style: fadedTextStyle,
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.person_outline,
//                             color: Color(0x99FFFFFF),
//                             size: 30,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 32.0),
//                       child: Text(
//                         "How You Doing?",
//                         style: whiteHeadingTextStyle,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 24.0),
//                       child: Consumer<AppState>(
//                         builder: (context, appState, _) =>
//                             SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: <Widget>[
//                               for (final category in categories)
//                                 CategoryWidget(category: category)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Consumer<AppState>(
//                         builder: (context, appState, _) => Column(
//                           children: <Widget>[
//                             for (final event in events.where((e) => e
//                                 .categoryIds
//                                 .contains(appState.selectedCategoryId)))
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.of(context).push(
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           EventDetailsPage(event: event),
//                                     ),
//                                   );
//                                 },
//                                 child: EventWidget(
//                                   event: event,
//                                 ),
//                               )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
