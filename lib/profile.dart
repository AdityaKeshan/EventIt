import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';
import 'review.dart';
import 'signin.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double width, height;
  static FirebaseAuth firebaseAuthentication;
  List<String> a=['Tech Talks','Apptitude',"MozoHack'21"];
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    //widgets
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index==3) {

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
        Navigator.popAndPushNamed(context,'/news');
      }
    });
  }
  Widget listViewElement(int i)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Review(title: Data.events[i],)));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0,color: Color(0XFF000000)) ) ,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          Data.events[i],style: TextStyle(
          fontSize: 20.0
        ),
        ),
        height: 40.0,

      ),
    );
  }
  Widget container(String a, String b) {
    TextEditingController td = new TextEditingController();
    td.text = b;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        controller: td,
        readOnly: true,
        onChanged: (text) {},
        textCapitalization: TextCapitalization.words,
        style: TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          labelText: "$a",
          labelStyle: TextStyle(color: Colors.white),
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.white, style: BorderStyle.solid)),
          hintStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          hintText: 'Enter your name',
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseAuthentication=FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    // firebaseAuthentication=FirebaseAuth.instance;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
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
        currentIndex: 3,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
      ),


        body: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/signupback.png'),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:() async {
                Fluttertoast.showToast(msg: "Signed Out");
                firebaseAuthentication.signOut();
                
                SharedPreferences.getInstance().then((value) => value.clear());
                Navigator.popAndPushNamed(context, "/");
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.power_settings_new_rounded
                  ,color: Colors.white,
                  size: 35.0,) ,
                ),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Icon(
              Icons.person_rounded,
              size: 105.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 45.0,
            ),
            container("Name", Data.userData.name),
            container("Reg No.", Data.userData.reg),
            container("Email", Data.userData.email),
            container("Phone", Data.userData.phone),
            Padding(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Registered Events:",style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0
                ),),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
            ),
            SizedBox(height:10.0),
            Expanded(
              child: ListView.builder(itemCount:Data.events.length,itemBuilder: (BuildContext context, int index) {
                return listViewElement(index);
              },

              ),
            )
          ],
        ),
      ),
    ));
  }
}
