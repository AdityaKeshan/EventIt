import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';
import 'review.dart';
import 'signin.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileAdmin extends StatefulWidget {
  @override
  _ProfileAdminState createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  double width, height;
  static FirebaseAuth firebaseAuthentication;
  List<String> a=['Tech Talks','Apptitude',"MozoHack'21"];
  int _selectedIndex = 3;
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
        Navigator.popAndPushNamed(context,'/homeadmin');
      }
      else if(index==1)
      {
        Navigator.popAndPushNamed(context,'/create');
      }
      else
      {
        Navigator.popAndPushNamed(context,'/newsadmin');
      }
    });
  }
  Widget listViewElement(int i)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Review(title: a[i],)));
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
              icon: Icon(Icons.create_new_folder),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'ProfileAdmin',
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
                    Data.adminData=null;
                    Data.adminEvents.clear();
                    Data.isAdmin=false;
                    Data.adminNo=0;
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
                container("Name", Data.adminData.name),
                container("Events Id", Data.adminData.events),
                container("Email", Data.adminData.email),
                container("Phone", Data.adminData.phone),
              ],
            ),
          ),
        ));
  }
}
