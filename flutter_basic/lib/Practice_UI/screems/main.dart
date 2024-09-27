import 'package:flutter/material.dart';
import 'package:flutter_basic/Practice_UI/screems/core/routers/app_generate_route.dart';
import 'package:flutter_basic/Practice_UI/screems/core/routers/app_routers.dart';
import 'package:flutter_basic/Practice_UI/screems/core/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: AppThemes.defaultTheme,
      onGenerateRoute: AppGenerateRoute.onGenerate,
      initialRoute: AppRouters.login,
    );
  }
}
