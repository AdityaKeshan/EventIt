import 'package:flutter/material.dart';

class PaymentSucess extends StatefulWidget {
  const PaymentSucess({Key key}) : super(key: key);

  @override
  _PaymentSucessState createState() => _PaymentSucessState();
}

class _PaymentSucessState extends State<PaymentSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:Container(
              constraints:BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.0,),
                  Text(
                    ' PAID SUCCESSFULLY',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.green[700],
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Center(
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green[700],
                      size: 150.0,
                    ),
                  ),
                  SizedBox(height: 60.0,),
                  Text(
                    ' Rs. 250',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text:' to',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text:' Music Club VIT',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.orange[900],
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text:' for',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text:' SOUNDSCAPES',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.orange[900],
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]
                    ),
                  ),
                  SizedBox(height:40.0),
                  Divider(
                    height: 20.0,
                    thickness: 2.0,
                    color: Colors.grey[800],

                  ),
                  Text(
                    'TRANSACTION ID: 267424 13327',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        // letterSpacing: 1.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            )
        )
    );;
  }
}
