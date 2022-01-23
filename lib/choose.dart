// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

class choose extends StatefulWidget {
  @override
  _chooseState createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                    child: Text(
                      'Signup As',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
                child: Center(
              child: Column(
                children: <Widget>[Image.asset('assets/investor.png')],
              ),
            )),
            SizedBox(height: 20.0),
            Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(6.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.blue,
                  elevation: 10.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text('Entrepreneur',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                    ),
                  ),
                )),
            SizedBox(height: 20.0),
            Container(
                child: Center(
              child: Column(
                children: <Widget>[Image.asset('assets/investor.png')],
              ),
            )),
            SizedBox(height: 20.0),
            Container(
              height: 40.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0)),
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Text('Investor',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat')),
                  ),
                ),
              ),
            ),
          ],
        ));
    // SizedBox(height: 15.0),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text(
    //       'New to Spotify?',
    //       style: TextStyle(
    //         fontFamily: 'Montserrat',
    //       ),
    //     ),
    //     SizedBox(width: 5.0),
    //     InkWell(
    //       child: Text('Register',
    //           style: TextStyle(
    //               color: Colors.green,
    //               fontFamily: 'Montserrat',
    //               fontWeight: FontWeight.bold,
    //               decoration: TextDecoration.underline)),
    //     )
    //   ],
    // )
  }
}
