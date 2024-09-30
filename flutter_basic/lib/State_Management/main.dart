import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management/forgot_password/forgot_password_screen.dart';
import 'package:flutter_basic/State_Management/home/home_screen.dart';
import 'package:flutter_basic/State_Management/login/login_screen.dart';
import 'package:flutter_basic/State_Management/theme/my_theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_basic/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.darkTheme(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case 'home':
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case 'forgot_password':
            return MaterialPageRoute(
                builder: (_) => const ForgotPasswordScreen());
          default:
            return null;
        }
      },
      initialRoute: '/',
    );
  }
}
