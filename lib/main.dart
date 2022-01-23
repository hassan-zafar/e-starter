// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unrelated_type_equality_checks, unused_local_variable, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estarter1/Models/users.dart';
import 'package:estarter1/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Database/user_api.dart';
import 'Services/auth_methods.dart';
import 'Tools/custom_toast.dart';
import 'Tools/show_loading.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(EStarter());
}

class EStarter extends StatelessWidget {
  static const kPrimaryColor = Color(0xFFFF8F00);

  EStarter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Starter',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(title: 'E-Starter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Starter'),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email = '';
  String password = '';
  final Type value = Null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 50.0, 0.0),
                      child: Text('E-Starter',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Bold.ttf',
                            color: Colors.blue,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 200.0, 0.0, 0.0),
                      child: Text('Welcome to Your Fututre',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Bold.ttf',
                            color: Colors.blue,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(150.0, 215.0, 0.0, 0.0),
                      child: Text('...',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(25.0, 35.0, 25.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          onChanged: (value) {
                            email = value.toString().trim();
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a Valid Email");
                            } else {
                              return null;
                            }
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          RegExp regex = new RegExp(r'^.{6,}$');
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password. Minimum 6 Characters';
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password. Min. 6 Character");
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'Enter Password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  )),
              SizedBox(height: 5.0),
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 20.0),
                child: Center(
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () {
                  print('hjer');
                  _submitForm();
                },
                child: SizedBox(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Material(
                      borderRadius: BorderRadius.circular(6.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.blue,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'SIGNIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 30.0),
              SizedBox(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Material(
                    borderRadius: BorderRadius.circular(6.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.blue,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ));
                      },
                      child: Center(
                        child: Text(
                          'Do not have Account. SignUp Here',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }

  void _submitForm() async {
    print(_passwordController.text.trim());
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text.trim() != '') {
        showLoadingDislog(context);

        FocusScope.of(context).unfocus();
        final User? _user = await AuthMethod().signupWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (_user == null) {
          Navigator.of(context).pop();
          return;
        }
        String date = DateTime.now().toString();
        DateTime dateparse = DateTime.parse(date);
        String formattedDate =
            '${dateparse.day}-${dateparse.month}-${dateparse.year}';
        String _imageURL = '';

        AppUserModel _appUser = AppUserModel(
          id: _user.uid,
          name: _emailController.text.trim(),
          email: _emailController.text.trim(),
          isAdmin: false,
          imageUrl: _imageURL,
          createdAt: Timestamp.now(),
          joinedAt: formattedDate,
          password: _passwordController.text.trim(),
        );
        final bool _save = await UserAPI().addUser(_appUser);
        if (_save) {
          CustomToast.successToast(message: 'Signup successfully');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => SignupPage(),
          ));
        } else {
          Navigator.of(context).pop();
        }
      } else {
        CustomToast.errorToast(
          message: 'Password and confirm password should be same',
        );
      }
    }
  }
}
/*
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
void signIn(String email, String password) async {
  if (_formKey.currentState!.validate()) {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "LogIn Successful"),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => homeent()))
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }
}
*/