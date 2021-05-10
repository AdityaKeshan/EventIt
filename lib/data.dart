import 'dart:convert';

import 'user_data.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:shared_preferences/shared_preferences.dart';
class Data
{
  static UserData userData;
  FirebaseDatabase firebaseDatabase;
  Future<SharedPreferences> pref=SharedPreferences.getInstance();
  static List<String> events=[];
  static void display()
  {
    print(userData.toJson());
  }
  static void creator()
  {
    String k=userData.events;
    var z=k.split(" | ");
    for(var y in z)
      {
        events.add(y.toString());
      }
  }
  void getUserData(String a) async
  {
    firebaseDatabase=FirebaseDatabase.instance;
    var b=firebaseDatabase.reference().child("User").orderByChild('email');
    b.once().then((DataSnapshot snapshot)  {
      Map < dynamic, dynamic > m=snapshot.value;

      for(var b in m.values)
        {
          print("2");
          if(b['email']==a)
            {
              userData=new UserData(avatar: b['avatar'].toString(),email: a,events: b['events'].toString(),name: b['name'].toString(),password: b['password'].toString(),
              phone: b['phone'].toString(),reg: b['reg'].toString());
              print(userData.toJson());
              print("Found");
              
              pref.then((value) => value.setString("User", jsonEncode(userData)));
              String k=b['events'];
              var z=k.split(" | ");
              for(var y in z)
              {
                events.add(y.toString());
              }
              break;
            }
        }
    });
  }
}