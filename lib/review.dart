import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatefulWidget {
  const Review({Key key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/signupback.png'),
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 45.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tech Talks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 40.0),
                  child: Text(
                    "Rating:",
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 20.0),
                  child: RatingBarIndicator(
                    itemCount: 5,
                    rating: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 30.0),
                  child: Text(
                    "Comments:",
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
                Container(
                  color: Colors.white38,
                  margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "An amazing event I learned so much from it. The content writer was so good and the person woh made the website design was also good.",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0, top: 30.0),
                      child: Text(
                        "Media:",
                        style: TextStyle(color: Colors.white, fontSize: 35.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0,top: 30.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child:
                        ElevatedButton(
                            style: ButtonStyle(

                            ),
                            onPressed: () {

                            }, child: Text("Upload Media",
                          style: TextStyle(
                              fontSize: 20.0
                          ),)),
                      ),
                    ),
                  ],

                ),
                Container(

                  margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                  child: Image.asset('assets/images/cc.jpeg',fit:BoxFit.fill ,),
                ),
                Container(

                  margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                  child: Image.asset('assets/images/cc.jpeg',fit:BoxFit.fill ,),
                ),
                Container(

                  margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
                  child: Image.asset('assets/images/cc.jpeg',fit:BoxFit.fill ,),
                )
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child:
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                  ),
                  onPressed: () {

                  }, child: Text("Submit",
                style: TextStyle(
                    fontSize: 20.0
                ),)),
            ),
          ),
        ],
      ),
    );
  }
}
