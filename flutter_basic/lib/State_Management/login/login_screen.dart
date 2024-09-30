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
  Widget build(BuildContext context) {
    //! BlocProvider
    //? được sử dụng để tạo một instance của LoginBloc và cung cấp nó cho cây widget con.
    //? Điều này đảm bảo rằng LoginBloc có thể được truy cập từ bất kỳ widget nào bên trong cây mà cần tới nó.
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: Builder(builder: (context) {
          //! BlocListener
          //? được dùng để lắng nghe các thay đổi trạng thái từ LoginBloc
          //? và phản hồi (thông qua UI) dựa trên các trạng thái này.
          return BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              //? được dùng để lắng nghe các thay đổi trạng thái từ LoginBloc và phản hồi (thông qua UI)
              //? dựa trên các trạng thái này.

              //?  Trong trường hợp này, nó đang lắng nghe các trạng thái thất bại và thành công của quá trình đăng nhập.
              if (state is ForgotPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.successfulMsg ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
                Navigator.pushNamed(context, "forgot_password");
              } else if (state is FailedLoginState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.errorMessage ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              } else if (state is SuccessfullyLoginState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.successfulMsg ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ));
                Navigator.pushNamed(context, "home");
              }
            },
            child: GestureDetector(
              onTap: () {
                print(" onPressed");
                FocusScope.of(context).unfocus();
              },
              behavior: HitTestBehavior
                  .opaque, // Ensure taps on the empty space are registered
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 45),
                          child: AppIconSection(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 43),
                          child: Column(
                            children: [
                              UsernamePasswordSection(
                                userNameTextController: userNameTextController,
                                passwordTextController: passwordTextController,
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  return ForgotPasswordSection(
                                    onPressed: () {
                                      BlocProvider.of<LoginBloc>(context).add(
                                        ForgotPassword(
                                            username:
                                                userNameTextController.text),
                                      );
                                    },
                                  );
                                },
                              ),
                              //! BlocBuilder
                              //? được sử dụng để xây dựng UI phụ thuộc vào trạng thái hiện tại của LoginBloc
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  //? Trong trường hợp này, BlocBuilder xác định
                                  //? nếu trạng thái là LoadingLoginState để hiển thị giao diện loading.
                                  final isLoading = state is LoadingLoginState;
                                  return LoginButtonSection(
                                    isLoading: isLoading,
                                    onPressed: () {
                                      //? Khi nút đăng nhập được nhấn,
                                      //? một sự kiện LoginWithUsernamePassword sẽ được gửi tới LoginBloc
                                      //? với tên người dùng và mật khẩu từ các trường nhập liệu.
                                      BlocProvider.of<LoginBloc>(context)
                                          .add(LoginWithUsernamePassword(
                                        username: userNameTextController.text,
                                        password: passwordTextController.text,
                                      ));
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        const OtherSignInMethodSection()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }
}
