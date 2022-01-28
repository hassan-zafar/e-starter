import 'package:estartup/database/auth_methods.dart';
import 'package:estartup/screens/main_screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/entrepreneur_nav_bar_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EntrepreneurNavBarProvider>(
          create: (BuildContext context) => EntrepreneurNavBarProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Stater',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: (AuthMethods.getCurrentUser() == null)
            ? const LoginScreen()
            : const MainScreen(),
        routes: {
          LoginScreen.routeName: (_) => const LoginScreen(),
          RegisterScreen.routeName: (_) => const RegisterScreen(),
          MainScreen.rotueName: (_) => const MainScreen(),
        },
      ),
    );
  }
}
