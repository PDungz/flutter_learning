import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/routers/app_routers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  final _keyUsername = GlobalKey<FormFieldState>();
  final _keyPassword = GlobalKey<FormFieldState>();

  bool onShowPassword = true;

  _onCheckPassword() {
    setState(() {
      onShowPassword = !onShowPassword;
    });
  }

  _onLogin() {
    bool isFormOky = _keyForm.currentState?.validate() ?? false;
    if (isFormOky) {
      Navigator.pushNamed(context, AppRouters.home, arguments: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: double.infinity,
              child: SvgPicture.asset('assets/icons/AppIcon.svg')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Form(
              key: _keyForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Username'),
                  TextFormField(
                    key: _keyUsername,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Username",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFFFF8036),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Pasword'),
                  TextFormField(
                    key: _keyPassword,
                    obscureText: onShowPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Pasword",
                      prefixIcon: const Icon(
                        Icons.lock, // Icon khóa ở đầu
                        color: Color(0xFFFF8036), // Màu của icon khóa
                      ),
                      suffixIcon: onShowPassword
                          ? IconButton(
                              icon: const Icon(
                                Icons.visibility_off, // Icon con mắt
                                color:
                                    Color(0xFF6A6F7D), // Màu của icon con mắt
                              ),
                              onPressed: _onCheckPassword,
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.visibility, // Icon con mắt
                                color:
                                    Color(0xFF6A6F7D), // Màu của icon con mắt
                              ),
                              onPressed: _onCheckPassword,
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: const Color(0xFFFF8036)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onLogin,
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Or sigin with',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: MediaQuery.of(context).size.width * 0.12,
                      ),
                      const Text('Google'),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/facebook.png',
                        width: MediaQuery.of(context).size.width * 0.12,
                      ),
                      const Text('Google'),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}
