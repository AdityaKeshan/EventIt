import 'dart:convert';

import 'eventdata.dart';
import 'event.dart' as e;
import 'user_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  static UserData userData, adminData;
  static FirebaseDatabase firebaseDatabase;
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  static Map<dynamic, dynamic> news;
  static bool isAdmin = false;
  static List<e.Event> adminEvents = [];
  static var adminNo;
  static List<String> events = [];
  static List<e.Event> newsData = [];
  static List<e.Event> userEvents = [];
  static List<String> uRLS=[];
  Future<void> getEvents() async {
    var b = firebaseDatabase.reference().child("Events");
    await b.once().then((DataSnapshot val) {
      Map<dynamic, dynamic> m = val.value;
      for (var a in m.keys) {
        var k = m[a];
        e.Event c = new e.Event(
            title: k['title'],
            description: k['description'],
            date: k['date'],
            fees: k['fee'].toString(),
            rating: k['rating'].toString(),
            duration: k['time'],
            comments: k['comments'],
            coverUrl: k['coverUrl']);
        userEvents.add(c);
      }
    });
  }
  Future<void> urls(String a) async
  {
    var b=getEventId(a);
    List<String> url=[];
    FirebaseStorage storage=FirebaseStorage.instance;
    var c=await storage.ref("images/"+b.toString());
  c.listAll().then((value) async {
    var d=value.items;
    for(var e in d)
      {
        url.add(await e.getDownloadURL());
      }
  }
    );
  uRLS=url;
  }
  Future<dynamic> getEventId(String ab) async {
    var b = firebaseDatabase.reference().child("Events");
    await b.once().then((DataSnapshot val) {
      Map<dynamic, dynamic> m = val.value;
      for (var a in m.keys) {
        var k = m[a];
        if (k['title'] == ab) {
          return a;
        }
      }
    });
    return 1234;
  }

  Future<void> getNews() async {
    events.clear();
    firebaseDatabase = FirebaseDatabase.instance;
    var b = firebaseDatabase.reference().child("News");
    await b.once().then((DataSnapshot val) {
      news = val.value;
      for (var k in news.keys) {
        var k1 = news[k];
        print(k1);
        e.Event a1 = new e.Event(
            imagePath: "assets/event_images/VITEEE.jpg",
            title: k1['title'],
            location: k1['location'],
            description: k1['detail'],
            punchLine1: k1['total']);
        newsData.add(a1);
      }
    });
  }

  static void display() {
    print(userData.toJson());
  }

  static void creator() {
    String k = userData.events;
    var z = k.split(" | ");
    for (var y in z) {
      events.add(y.toString());
    }
  }

  Future<List<e.Event>> getEvent(String a) async {
    List<e.Event> events = [];
    firebaseDatabase = FirebaseDatabase.instance;
    var b =
        firebaseDatabase.reference().child("Events").orderByChild('keywords');
    b.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> m = snapshot.value;
      for (var b in m.values) {
        if (b['keywords'] == a) {
          e.Event a1 = new e.Event(
              coverUrl: b['coverUrl'],
              date: b['date'],
              description: b['description'],
              fees: b['fee'],
              duration: b['time'],
              title: b['title'],
              rating: b['rating'].toString(),
              comments: b['comments']);
          events.add(a1);
        }
      }
    });
    return events;
  }

  void reInitAdminEvents() async {
    String k = adminData.events;
    print(k);
    List<String> z = k.split(",");
    for (String y in z) {
      await getEventById(y);
    }
    print(adminEvents.toString());
  }

  Future<void> getEventById(String a) async {
    e.Event c;
    firebaseDatabase = FirebaseDatabase.instance;
    var b = firebaseDatabase.reference().child("Events/");
    b.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> m = snapshot.value;
      print("ABCD");
      print(m);
      for (var b in m.keys) {
        if (b == a) {
          var k = m[b];
          print("Found Event");
          // TODO:Add Comments in event details
          c = new e.Event(
              coverUrl: k['coverUrl'],
              title: k['title'],
              description: k['description'],
              date: k['date'],
              fees: k['fees'],
              rating: k['rating'],
              duration: k['time'],
              comments: k['comments']);
          print(c);
          adminEvents.add(c);
          break;
        }
      }
    });
  }

  void getAdminData(String a) async {
    firebaseDatabase = FirebaseDatabase.instance;
    var b = firebaseDatabase.reference().child("Admins").orderByChild('email');
    b.once().then((DataSnapshot snapshot) async {
      Map<dynamic, dynamic> m = snapshot.value;
      print(m);
      for (var c in m.keys) {
        print("2");
        var b = m[c];
        if (b['email'] == a) {
          adminNo = c;
          pref.then((value) => value.setString("UserId", adminNo.toString()));
          adminData = new UserData(
              email: a,
              events: b['events'].toString(),
              name: b['name'].toString(),
              password: b['password'].toString(),
              phone: b['phone'].toString(),
              reg: b['reg'].toString());
          print("Found");

          pref.then((value) => value.setString("User", jsonEncode(adminData)));
          String k = b['events'];
          print(k);
          List<String> z = k.split(",");
          for (String y in z) {
            await getEventById(y);
          }
          break;
        }
      }
    });
  }

  void getUserData(String a) async {
    firebaseDatabase = FirebaseDatabase.instance;
    var b = firebaseDatabase.reference().child("User").orderByChild('email');
    b.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> m = snapshot.value;

      for (var b in m.values) {
        print("2");
        if (b['email'] == a) {
          userData = new UserData(
              avatar: b['avatar'].toString(),
              email: a,
              events: b['events'].toString(),
              name: b['name'].toString(),
              password: b['password'].toString(),
              phone: b['phone'].toString(),
              reg: b['reg'].toString());
          print(userData.toJson());
          print("Found");

          pref.then((value) => value.setString("User", jsonEncode(userData)));
          String k = b['events'];
          var z = k.split(" | ");
          for (var y in z) {
            events.add(y.toString());
          }
          break;
        }
      }
    });
  }
}
//Code for uplaoding images
// FirebaseStorage storage=FirebaseStorage.instance;
// try {
// await storage.ref("images/file.png").putFile(f[0]);
// String k=await storage.ref("images/file.png").getDownloadURL();
// print(k);
// }
// on FirebaseException catch (e) {
// // e.g, e.code == 'canceled'
// print("Error");
// }
