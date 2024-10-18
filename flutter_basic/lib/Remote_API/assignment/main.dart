import 'package:flutter/material.dart';
import 'package:flutter_basic/Remote_API/homework/core/utils/dot_env_util.dart';

import 'core/routers/app_generate_route.dart';
import 'core/routers/app_routers.dart';
import 'core/themes/app_themes.dart';

void main() async {
  await DotEnvUtil.initDotEnv();
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
