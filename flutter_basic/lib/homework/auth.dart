import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/homework/validators.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Auth Login',
      home: Auth(),
    ),
  );
}

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _keyForm = GlobalKey<FormState>();
  final _userNameKey = GlobalKey<FormFieldState>();
  final _passWordKey = GlobalKey<FormFieldState>();

  bool isPassWordShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.12),
              Colors.purple.withOpacity(0.12),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Form(
          key: _keyForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              // Instagram Logo (replace with actual logo asset)
              Image.asset(
                'assets/images/instagram.png', // Add your logo here
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 40),
              // Username/Email TextField
              TextFormField(
                key: _userNameKey,
                validator: Validator.requiredFieldValidator('Username').call,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Username, email or mobile number',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              TextFormField(
                key: _passWordKey,
                validator: Validator.password.call,
                obscureText: !isPassWordShow,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: Material(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: isPassWordShow
                          ? IconButton(
                              onPressed: onCheckPassWord,
                              icon: const Icon(CupertinoIcons.eye_fill))
                          : IconButton(
                              onPressed: onCheckPassWord,
                              icon: const Icon(CupertinoIcons.eye_slash_fill)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Log In Button
              ElevatedButton(
                onPressed: onLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 129, 235),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              // Forgot password
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const Spacer(),
              // Create new account button
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Create new account',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              // Meta text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/meta-brands-solid.svg',
                    height: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Meta',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCheckPassWord() {
    isPassWordShow = !isPassWordShow;
    setState(() {});
  }

  onLogin() {
    _keyForm.currentState!.validate();
  }
}
