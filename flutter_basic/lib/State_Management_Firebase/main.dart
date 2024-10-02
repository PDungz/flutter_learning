import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management_Firebase/home/home_screen.dart';
import 'package:flutter_basic/State_Management_Firebase/login/login_screen.dart';
import 'package:flutter_basic/State_Management_Firebase/root_page.dart';
import 'package:flutter_basic/State_Management_Firebase/theme/my_theme.dart';
import 'package:flutter_basic/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          default:
            return null;
        }
      },
      home: const RootPage(),
    );
  }
}
