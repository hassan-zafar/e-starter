import 'package:estartup/screens/main_screen/main_screen.dart';
import 'package:estartup/widgets/custom_elevated_button.dart';
import 'package:estartup/widgets/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../database/auth_methods.dart';
import '../../utilities/custom_image.dart';
import '../../utilities/custom_validator.dart';
import '../../utilities/utilities.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/password_textformfield.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(Utilities.padding),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                title: 'Email',
                controller: _email,
                hint: 'test@test.com',
                validator: (String? value) => CustomValidator.email(value),
              ),
              PasswordTextFormField(
                controller: _password,
              ),
              CustomElevatedButton(
                title: 'Login',
                onTap: () => _submitForm(),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '''Don't have an account?''',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text('Sign Up'.toUpperCase()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_key.currentState!.validate()) {
      showLoadingDislog(context);
      final User? _user = await AuthMethods().loginWithEmailAndPassword(
        _email.text,
        _password.text,
      );
      if (_user != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            MainScreen.rotueName, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pop();
      }
    }
  }
}
