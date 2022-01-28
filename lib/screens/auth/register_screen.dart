import 'package:estartup/database/user_api.dart';
import 'package:estartup/widgets/custom_elevated_button.dart';
import 'package:estartup/widgets/user_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../database/auth_methods.dart';
import '../../database/user_apisdsa.dart';
import '../../models/app_user.dart';
import '../../utilities/custom_validator.dart';
import '../../utilities/utilities.dart';
import '../../widgets/custom_textformfield.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/password_textformfield.dart';
import '../../widgets/show_loading.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = '/RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confPassword = TextEditingController();
  // ignore: prefer_final_fields
  bool _isEntrepreneur = true;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(Utilities.padding),
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/logo.png'),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      title: 'Full Name',
                      controller: _name,
                      validator: (String? value) =>
                          CustomValidator.lessThen3(value),
                    ),
                    CustomTextFormField(
                      title: 'email',
                      hint: 'test@test.com',
                      controller: _email,
                      validator: (String? value) =>
                          CustomValidator.email(value),
                    ),
                    PasswordTextFormField(controller: _password),
                    PasswordTextFormField(
                      controller: _confPassword,
                      title: 'Confirm Password',
                    ),
                    const SizedBox(height: 10),
                    UserTypeWidget(
                      isENTREPRENEUR: true,
                      onChanged: (p0) {},
                    ),
                    CustomElevatedButton(
                      title: 'Register',
                      onTap: () => _submitForm(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '''Already have an account?''',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName,
                          (Route<dynamic> route) => false);
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_key.currentState!.validate()) {
      if (_password.text != _confPassword.text) {
        CustomToast.errorToast(
          message: 'Password and Confirm password is not same',
        );
        return;
      }
      showLoadingDislog(context);
      final User? _myUser = await AuthMethods().signupWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      if (_myUser != null) {
        final AppUser _appUser = AppUser(
          uid: _myUser.uid,
          email: _email.text.trim(),
          name: _name.text.trim(),
          ideas: [],
          imageURL: '',
          rating: 0,
          status: true,
          isEntrepreneur: _isEntrepreneur,
        );
        final bool _okay = await UserAPI().addUser(_appUser);
        if (_okay) {
          CustomToast.successToast(message: 'Register Successfully');
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginScreen.routeName,
            (Route<dynamic> route) => false,
          );
        } else {
          Navigator.of(context).pop();
        }
      }
    }
  }
}
