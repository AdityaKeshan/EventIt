import 'dart:convert';

import 'eventdata.dart';
import 'event.dart' as e;
import 'user_data.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:shared_preferences/shared_preferences.dart';
class Data
{
  static UserData userData;
  static FirebaseDatabase firebaseDatabase;
  Future<SharedPreferences> pref=SharedPreferences.getInstance();
  static Map<dynamic,dynamic> news;
  static List<String> events=[];
  static List<e.Event> newsData=[];
  Future<void> getNews() async
  {
    events.clear();
    firebaseDatabase=FirebaseDatabase.instance;
    var b=firebaseDatabase.reference().child("News");
    await b.once().then((DataSnapshot val){
      news=val.value;
      for(var k in news.keys)
      {

        var k1=news[k];
        print(k1);
        e.Event a1=new e.Event(imagePath:"assets/event_images/VITEEE.jpg",title: k1['title'],location: k1['location'],description: k1['detail'],punchLine1: k1['total']);
        newsData.add(a1);
      }
    });

  }
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

  Future<List<EventData>> getEvent(String a)async{
    List<EventData> events=[];
    firebaseDatabase=FirebaseDatabase.instance;
    var b=firebaseDatabase.reference().child("Events").orderByChild('keywords');
    b.once().then((DataSnapshot snapshot)
    {
      Map<dynamic,dynamic> m=snapshot.value;
      for(var b in m.values)
        {
          if(b['keywords']==a)
            {
              EventData a=new EventData(date:b['date'],description: b['description'],fee: b['fee'],keywords:
              b['keywords'],time: b['time'],title: b['title'],rating: b['rating']);
              events.add(a);
            }
        }
    });
    return events;
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