// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, prefer_const_constructors, unrelated_type_equality_checks, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:ui';
import 'package:estarter1/home_entrpnr.dart';
import 'package:estarter1/home_invstr.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = '';
  String password = '';
  final Type value = Null;

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
                      padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 70.0, 0.0, 0.0),
                      child: Text(
                        '...',
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              labelText: 'Enter Your Name',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            if (value == Null) {
                              return 'Please Enter Your Name';
                            }
                          }),
                      SizedBox(height: 10.0),
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.verified_user,
                                color: Colors.black,
                              ),
                              labelText: 'UserName',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            if (value == Null) {
                              return 'Please enter UserName';
                            }
                          }),
                      SizedBox(height: 10.0),
                      TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            if (value == Null) {
                              return 'Please Enter Email';
                            }
                          }),
                      SizedBox(height: 10.0),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            if (value == Null) {
                              return 'Please Enter Password';
                            }
                          }),
                      SizedBox(height: 10.0),
                      TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              labelText: 'Re-Enter Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green))),
                          validator: (value) {
                            if (value == Null) {
                              return 'Please Re-Enter Password';
                            }
                          }),
                      SizedBox(height: 50.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(6.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeEntrepneur(),
                                ));
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP as Enterprenuer',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(6.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomeInvestor(),
                                ));
                              },
                              child: Center(
                                child: Text(
                                  'SIGNUP as Investor',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )),
            ]));
  }
}
