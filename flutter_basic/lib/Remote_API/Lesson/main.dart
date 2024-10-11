import 'package:flutter/material.dart';
import 'package:flutter_basic/Remote_API/Lesson/core/utils/dot_env_util.dart';
import 'package:flutter_basic/Remote_API/Lesson/presentation/pages/now_playing_movies_screen.dart';

void main(List<String> args) async {
  await DotEnvUtil.initDotEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NowPlayingMoviesScreen(),
    );
  }
}
