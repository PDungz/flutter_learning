import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'logic_event.dart';
part 'logic_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<LoginWithUsernamePassword>((event, emit) async {
      final username = event.username;
      final password = event.password;
      emit(LoadingLoginState());
      await Future.delayed(const Duration(seconds: 1), () {
        if (username == "admin" && password == "123") {
          emit(
            SuccessfullyLoginState(
              successfulMsg:
                  "Chúc mừng bạn đã login bằng username và password thành công",
            ),
          );
        } else {
          emit(
            FailedLoginState(
              errorMessage:
                  "Đăng nhập bằng username và password thất bại. Hãy thử lại sau!!!",
            ),
          );
        }
      });
    });

    on<LoginWithThirdParty>((event, emit) async {
      final isGoogleSignIn = event.isGoogle;
      final signInMethod = isGoogleSignIn ? "Google" : "Facebook";
      emit(LoginWithThirdPartyLoading());
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          final random = Random();
          final isSuccess = random.nextBool();
          if (isSuccess) {
            emit(
              SuccessfullyLoginState(
                  successfulMsg: "Dang nhap thanh cong bang $signInMethod"),
            );
          } else {
            emit(
              FailedLoginState(
                  errorMessage:
                      "Đăng nhập $signInMethod thất bại. Hãy thử lại sau!!!"),
            );
          }
        },
      );
    });

    on<ForgotPassword>((event, emit) async {
      final username = event.username;
      emit(ForgotPasswordLoading());
      await Future.delayed(const Duration(seconds: 1), () {
        if (username == 'admin') {
          emit(ForgotPasswordSuccess(
              successfulMsg: "Chúc mừng bạn đã quen password"));
        } else {
          emit(FailedLoginState(
              errorMessage: "Username cua ban nhap vao khong dung!!!"));
        }
      });
    });
  }
}
