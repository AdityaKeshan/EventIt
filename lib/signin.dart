import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'authentication.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

import 'user_data.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email,password;
  Icon icon;
  FirebaseApp firebase;
  Future<SharedPreferences> pref=SharedPreferences.getInstance();
  static FirebaseAuth firebaseAuthentication;
  TextEditingController _textEditingController;
  bool hidePass=true;
  Future<FirebaseApp> getFirebase() async
  {
    return Firebase.initializeApp();
  }
  void initFire() async{
    firebase=await getFirebase();

    firebaseAuthentication=FirebaseAuth.instance;
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    bool a=false;
    try {
      a = await pref.then((value) => value.getBool("Logged"));
    }
    catch(e)
    {
      a=false;
    }
    if(a)
    {
      Data.userData=await pref.then((value) => userDataFromJson(value.getString("User")));
      Data.creator();
      await Data().getNews();
      print(Data.events);
      Navigator.pushNamed(context, "/home");
    }
  }
  bool isVitEmail(String a)
  {
    final alp=RegExp(r'^[a-z]+\.[a-z]+20[1,2][7,8,9,0]@vitstudent.ac.in');
    return alp.hasMatch(a);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController=TextEditingController();
    SystemChrome.setEnabledSystemUIOverlays([]);
    icon=Icon(Icons.remove_red_eye);

  }
  @override
  void reassemble() {
    // TODO: implement reassemble

    super.reassemble();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
     initFire();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage('assets/images/backgroundImage.png'),
          ),
        ),
        child: ListView(

          children: [
            Padding(
              padding: EdgeInsets.only(top: 90.0,left:20.0),
              child: DefaultTextStyle(
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.w700,
                ) ,
                child: Text(
                  "Welcome\nBack",
                ),
              ),
            ),
            SizedBox(height: 140.0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (text)
                {
                  email=text;
                },
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
                ),
                decoration: InputDecoration(

                    hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: TextField(
                onChanged: (text)
                {
                  password=text;
                },
                obscureText: hidePass,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                ),
                decoration: InputDecoration(
                  suffix: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          if(hidePass)
                            {
                              icon=Icon(Icons.remove_red_eye_outlined);
                            }
                          else
                            {
                              icon=Icon(Icons.remove_red_eye);
                            }
                          hidePass=!hidePass;
                          
                        });
                      },
                      child: icon),
                  hoverColor: Colors.grey,
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(onPressed: () async
                  {
                    if(isVitEmail(email))
                      {
                        try{
                          UserCredential ab= await firebaseAuthentication.signInWithEmailAndPassword(email: email, password: password);
                          print("Success");
                          if(ab.user.emailVerified)
                          {
                                await Data().getUserData(email);
                                 await Data().getNews();
                                setState(() {
                                  pref.then((value) => {
                                    value.setBool('Logged', true)
                                  });
                                });
                                Timer(Duration(seconds: 4), ()
                                {
                                  Navigator.popAndPushNamed(context, '/home');
                                });

                          }
                          else
                          {
                            Fluttertoast.showToast(msg: "Please verify your email & try again later");
                          }

                        }
                        on FirebaseException catch(e)
                        {
                          if(e.code=='user-not-found')
                          {
                            Fluttertoast.showToast(msg: "User Does Not Exist");
                          }
                          else if(e.code=='wrong-password')
                          {
                            Fluttertoast.showToast(msg: "Invalid Password");
                          }
                        }
                      }
                    else
                      {
                        Fluttertoast.showToast(msg: "Enter a valid vit email");
                      }
                  },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.0,vertical: 6.0),
                  child: Text("Sign in"
              ,style: TextStyle(
                    fontSize: 25.0
                  ),),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0XFF3D4049)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )
                  )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 45.0,horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child:Text("Sign up",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    ),),
                    onTap: ()
                    {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                  GestureDetector(
                    onTap: ()
                    {
                      if(email==null)
                        {
                          Fluttertoast.showToast(msg: "Please enter the email");
                        }
                      else {
                        try {
                          firebaseAuthentication.sendPasswordResetEmail(
                              email: email);
                          Fluttertoast.showToast(
                              msg: "Password Reset email has been sent");
                        }
                        on FirebaseAuthException catch(e)
                      {
                        if(e.code=='invalid-email')
                          {
                            Fluttertoast.showToast(
                                msg: "Invalid email id");
                          }
                        else if(e.code=='user-not-found')
                          {
                            Fluttertoast.showToast(
                                msg: "User not registered");
                          }
                      }
                      catch(e)
                      {

                      }
                      }
                    },
                      child:Text("Forgot Password",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                        ),),),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
