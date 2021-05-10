import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name,reg_no,email,password,phone;
  Icon icon;
  FirebaseAuth firebaseAuth;
  FirebaseDatabase database;
  TextEditingController _textEditingController;
  bool hidePass=true;
  bool isVitEmail(String a)
  {
    final alp=RegExp(r'^[a-z]+\.[a-z]+20[1,2][7,8,9,0]@vitstudent.ac.in');
    return alp.hasMatch(a);
  }
  bool isReg(String a)
  {
    final alp=RegExp(r'^[1,2][8,9,0][A-Z]{3}[0-9]{4}');
    return alp.hasMatch(a);
  }
  bool isPhone(String a)
  {
    final alp=RegExp(r'^[7-9]{1}[0-9]{9}');
    return alp.hasMatch(a);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController=TextEditingController();
    SystemChrome.setEnabledSystemUIOverlays([]);
    icon=Icon(Icons.remove_red_eye);
    firebaseAuth=FirebaseAuth.instance;
    database=FirebaseDatabase.instance;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage('assets/images/signupback.png'),
          ),
        ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.0,left:20.0),
            child: DefaultTextStyle(
              style:TextStyle(
                color: Colors.white,
                fontSize: 60.0,
                fontWeight: FontWeight.w700,
              ) ,
              child: Text(
                "Sign Up",
              ),
            ),
          ),
          SizedBox(height: 40.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: TextField(
              onChanged: (text)
              {
                name=text;
              },
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.white) ,
                alignLabelWithHint: true,
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    style: BorderStyle.solid
                  )
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                hintText: 'Enter your name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: TextField(
              onChanged: (text)
              {
                reg_no=text;
              },
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
              decoration: InputDecoration(
                labelText: "Reg. number",
                labelStyle: TextStyle(color: Colors.white) ,

                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                hintText: 'Enter your Registration number',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (text)
              {
                email=text;
              },
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
              decoration: InputDecoration(
                labelText: "VIT Email",
                labelStyle: TextStyle(color: Colors.white) ,
                alignLabelWithHint: true,
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                hintText: 'Enter your Vit email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: TextField(
              obscureText: true,
              onChanged: (text)
              {
                password=text;
              },
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.white) ,
                alignLabelWithHint: true,
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                hintText: 'Enter your password',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: TextField(
              keyboardType: TextInputType.phone,
              onChanged: (text)
              {
                phone=text;
              },
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
              ),
              decoration: InputDecoration(
                labelText: "Phone",
                labelStyle: TextStyle(color: Colors.white) ,
                alignLabelWithHint: true,
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ) ,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white,
                        style: BorderStyle.solid
                    )
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                hintText: 'Enter your number',
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
              if((isVitEmail(email) )&&(isReg(reg_no) &&(isPhone(phone)&&(password!=null)&&(name!=null))))
                {
                  //TODO: Store user info into Realtime Database
                  try {
                    UserCredential ab = await firebaseAuth
                        .createUserWithEmailAndPassword(
                        email: email, password: password);
                    ab.user.sendEmailVerification();
                    int r=Random().nextInt(5);
                    Map<String,String> val={'name':name,'email':email,'reg':reg_no,'password':password,'phone':phone,'events':'','avatar':r.toString()};

                    database.reference().child("/User/$reg_no").set(val);
                    Navigator.pop(context);
                  }
                  on FirebaseAuthException catch( e) {
                    if (e.code == 'weak-password') {
                      Fluttertoast.showToast(msg: "Weak Password");
                    }
                    else if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(msg:'The account already exists for that email.');
                    }
                  }
                  catch(e)
                  {

                  }
                }
              else
                {
                  Fluttertoast.showToast(msg: "Wrong Credential Combination");
                }
            },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.0,vertical: 6.0),
                child: Text("Sign Up"
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
          Align(
            alignment: Alignment.center,
            child: Padding(padding: EdgeInsets.only(top: 20.0,bottom: 10.0),
            child: GestureDetector(
              onTap: ()
              {
                Navigator.pop(context);
              },
              child: Text("Sign In",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500
                ),),
            ),),
          )
        ],
      ),
      ),
    );
  }
}
