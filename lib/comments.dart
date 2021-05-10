// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:localeventsapp/ui/homepage/home_page.dart';
//
// class CreateEvent extends StatefulWidget {
//   CreateEvent({Key key}) : super(key: key);
//   @override
//   _CreateEventState createState() => _CreateEventState();
// }
//
// class _CreateEventState extends State<CreateEvent> {
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List<Widget> _widgetOptions = <Widget>[
//     //widgets
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: profileView(),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blue,
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard_rounded),
//             label: 'News',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.black,
//       ),
//     );
//   }
//
//   Widget profileView() {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.fromLTRB(30, 25, 30, 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 'Event details',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Container(height: 14, width: 24)
//             ],
//           ),
//         ),
//         Expanded(
//             child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//               gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   end: Alignment.bottomLeft,
//                   colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
//                 child: Container(
//                   height: 60,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Title',
//                           hintStyle: TextStyle(color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.white70)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                 child: Container(
//                   height: 60,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Description',
//                           hintStyle: TextStyle(color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.white70)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                 child: Container(
//                   height: 60,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Date',
//                           hintStyle: TextStyle(color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.white70)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                 child: Container(
//                   height: 60,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Time',
//                           hintStyle: TextStyle(color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.white70)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                 child: Container(
//                   height: 60,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Fee',
//                           hintStyle: TextStyle(color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.white70)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                 child: Container(
//                   height: 60,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Keywords',
//                           hintStyle: TextStyle(color: Colors.white),
//                         ),
//                         style: TextStyle(color: Colors.white70),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.white70)),
//                 ),
//               ),
//               RaisedButton(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.image),
//                     Text(
//                       "Upload Cover Photo",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 onPressed: () {},
//                 color: Colors.blue,
//                 textColor: Colors.orange,
//                 // padding: EdgeInsets.all(8.0),
//                 splashColor: Colors.grey,
//               ),
//               RaisedButton(
//                 child: Text(
//                   "Submit",
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {},
//                 color: Colors.red,
//                 textColor: Colors.yellow,
//                 padding: EdgeInsets.all(8.0),
//                 splashColor: Colors.grey,
//               ),
//             ],
//           ),
//         ))
//       ],
//     );
//   }
// }
