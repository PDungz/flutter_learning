import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic/Assignment/routes.dart';
import 'package:flutter_basic/Assignment/weahter_temperature.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: Routes.onGenerate,
    );
  }
}
