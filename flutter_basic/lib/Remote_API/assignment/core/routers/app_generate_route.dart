import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login_page.dart';
import '../../features/entry_point/entry_point.dart';
import '../../features/home/presentation/home_page.dart';
import 'app_routers.dart';

class AppGenerateRoute {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;
    bool isLogin = settings.arguments != null ? true : false;

    switch (route) {
      case AppRouters.login:
        return CupertinoPageRoute(builder: (_) => const LoginPage());
      case AppRouters.home:
        return CupertinoPageRoute(
            builder: (_) => HomePage(
                  isLogin: isLogin,
                ));
      case AppRouters.entry_point:
        return CupertinoPageRoute(builder: (_) => const EntryPoint());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return CupertinoPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Something went wrong!')),
      ),
    );
  }
}
