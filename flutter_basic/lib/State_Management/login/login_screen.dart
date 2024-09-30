import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management/login/bloc/logic_bloc.dart';
import 'package:flutter_basic/State_Management/login/widgets/app_icon_section.dart';
import 'package:flutter_basic/State_Management/login/widgets/forgot_password_section.dart';
import 'package:flutter_basic/State_Management/login/widgets/login_button_section.dart';
import 'package:flutter_basic/State_Management/login/widgets/other_sign_in_method_section.dart';
import 'package:flutter_basic/State_Management/login/widgets/username_password_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController userNameTextController;
  late final TextEditingController passwordTextController;
  @override
  void initState() {
    super.initState();
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  void _onLogin(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(LoginWithUsernamePassword(
      username: userNameTextController.text,
      password: passwordTextController.text,
    ));
  }

  void _onForgotPassword(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(
      ForgotPassword(username: userNameTextController.text),
    );
  }

  void _showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.white)),
          backgroundColor: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              _showSnackbar(
                  context,
                  state.successfulMsg ?? 'Password reset successful',
                  Colors.green);
              Navigator.pushNamed(context, "forgot_password");
            } else if (state is FailedLoginState) {
              _showSnackbar(
                  context, state.errorMessage ?? 'Login failed', Colors.red);
            } else if (state is SuccessfullyLoginState) {
              _showSnackbar(context, state.successfulMsg ?? 'Login successful',
                  Colors.green);
              Navigator.pushNamed(context, "home");
            }
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 45),
                      const AppIconSection(),
                      const SizedBox(height: 43),
                      UsernamePasswordSection(
                        userNameTextController: userNameTextController,
                        passwordTextController: passwordTextController,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return ForgotPasswordSection(
                              onPressed: () => _onForgotPassword(context));
                        },
                      ),
                      const SizedBox(height: 45),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          final isLoading = state is LoadingLoginState;
                          return LoginButtonSection(
                              isLoading: isLoading,
                              onPressed: () => _onLogin(context));
                        },
                      ),
                      const SizedBox(height: 45),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return OtherSignInMethodSection(
                            onGoogle: () => BlocProvider.of<LoginBloc>(context)
                                .add(LoginWithThirdParty(isGoogle: true)),
                            onFacebook: () =>
                                BlocProvider.of<LoginBloc>(context)
                                    .add(LoginWithThirdParty(isGoogle: false)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
