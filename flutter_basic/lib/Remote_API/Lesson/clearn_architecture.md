# Dự án Flutter - Clean Architecture

Dự án này tuân theo mô hình **Clean Architecture** để đảm bảo tính dễ bảo trì, khả năng mở rộng và dễ kiểm thử. Dự án được chia thành ba lớp chính: **Data** (Dữ liệu), **Domain** (Miền), và **Presentation** (Trình bày).

## Cấu trúc dự án

```
lib/
├── core/
│   ├── apis/
│   │   ├── dio_interceptors/
│   │   └── dio_client.dart
│   ├── constants/
│   ├── routers/
│   ├── services/
│   ├── themes/
│   └── utils/
│       └── dot_env_util.dart
├── feature/
│   └── login/
│       ├── data/
│       │   ├── data_source/
│       │   ├── model/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecase/
│       └── presentation/
│           ├── pages/
│           ├── widgets/
│           └── bloc/
└── main.dart
```

### 1. **lib/core/**

Thư mục này chứa các tài nguyên dùng chung trong toàn dự án:

- **apis/dio_client.dart**: Cấu hình và quản lý các yêu cầu HTTP sử dụng thư viện `Dio`.
- **constants/**: Chứa các hằng số toàn cục (ví dụ: URL API, mã lỗi).
- **routers/**: Quản lý định tuyến và điều hướng của ứng dụng.
- **services/**: Chứa các dịch vụ dùng chung, có thể được sử dụng bởi nhiều tính năng khác nhau.
- **themes/**: Quản lý giao diện toàn cục của ứng dụng như màu sắc và phông chữ.
- **utils/dot_env_util.dart**: Xử lý cấu hình `.env` cho các thiết lập theo môi trường.

### 2. **lib/feature/login/**

Thư mục này chứa chức năng `login`, được chia thành các lớp sau:

#### 2.1 **Lớp Dữ liệu (data/)**

Quản lý dữ liệu, tương tác với API bên ngoài và cơ sở dữ liệu nội bộ.

- **data_source/**: Chứa các nguồn dữ liệu như gọi API hoặc lưu trữ cục bộ.
  - Ví dụ: `login_remote_data_source.dart` thực hiện các yêu cầu API để xác thực người dùng.
- **model/**: Mô hình dữ liệu dùng để chuyển đổi giữa phản hồi API và dữ liệu yêu cầu.
  - Ví dụ: `LoginModel` chuyển đổi phản hồi JSON thành các đối tượng Dart.
- **repositories/**: Quản lý luồng dữ liệu bằng cách tương tác với các nguồn dữ liệu và gửi dữ liệu đến lớp domain.
  - Ví dụ: `LoginRepositoryImpl` lấy dữ liệu từ `LoginRemoteDataSource` và cung cấp cho các use case.

#### 2.2 **Lớp Miền (domain/)**

Lớp logic nghiệp vụ cốt lõi của ứng dụng.

- **entities/**: Đại diện cho các đối tượng cốt lõi trong logic nghiệp vụ (ví dụ: đối tượng `User`).
  - Ví dụ: Thực thể `User` có các thuộc tính như `id`, `email`, `name`.
- **repositories/**: Định nghĩa giao diện cho các kho dữ liệu, được triển khai trong lớp data.
  - Ví dụ: `LoginRepository` định nghĩa các phương thức như `loginUser` và `logout`.
- **usecase/**: Định nghĩa các hành động logic nghiệp vụ cụ thể (use case) và tương tác với các kho dữ liệu.
  - Ví dụ: `LoginUseCase` định nghĩa logic cho việc xác thực người dùng bằng cách gọi repository.

#### 2.3 **Lớp Trình bày (presentation/)**

Quản lý giao diện người dùng và trạng thái bằng cách sử dụng mô hình **Bloc**.

- **pages/**: Chứa các trang giao diện người dùng cho chức năng đăng nhập.
  - Ví dụ: `LoginPage` bao gồm form để nhập email và mật khẩu.
- **widgets/**: Chứa các widget có thể tái sử dụng cho chức năng đăng nhập.
  - Ví dụ: `LoginFormWidget` chứa các trường nhập liệu và nút gửi của form đăng nhập.
- **bloc/**: Quản lý trạng thái của chức năng đăng nhập bằng Bloc.
  - Ví dụ: `LoginBloc` lắng nghe các sự kiện đăng nhập và cập nhật trạng thái giao diện người dùng tương ứng.

### 3. **lib/main.dart**

Điểm khởi đầu của ứng dụng. Nó khởi tạo định tuyến và thiết lập màn hình ban đầu (ví dụ: trang đăng nhập).

---

## Ví dụ: Luồng Đăng nhập

### 1. **Luồng yêu cầu đăng nhập**

Dưới đây là ví dụ về quá trình đăng nhập thông thường:

1. Người dùng nhập email và mật khẩu trong `LoginFormWidget` và nhấn nút đăng nhập.
2. `LoginFormWidget` kích hoạt sự kiện `LoginButtonPressed` trong `LoginBloc`.
3. `LoginBloc` gửi sự kiện `LoginButtonPressed` đến `LoginUseCase`.
4. `LoginUseCase` tương tác với `LoginRepository` để xác thực người dùng.
5. `LoginRepositoryImpl` gửi yêu cầu đến `LoginRemoteDataSource` để xác minh thông tin đăng nhập qua API.
6. Nếu đăng nhập thành công, `LoginBloc` phát trạng thái `LoginSuccess` và giao diện sẽ chuyển sang trang chính. Nếu thất bại, trạng thái `LoginFailure` sẽ được phát kèm thông báo lỗi.

### 2. **Ví dụ mã nguồn**

#### **LoginBloc (bloc/login_bloc.dart)**

```dart
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      final result = await loginUseCase(LoginParams(
        email: event.email,
        password: event.password,
      ));

      yield result.fold(
        (failure) => LoginFailure(error: failure.message),
        (user) => LoginSuccess(user: user),
      );
    }
  }
}
```

#### **LoginUseCase (domain/usecase/login_usecase.dart)**

```dart
class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, User>> call(LoginParams params) {
    return repository.loginUser(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
```

#### **LoginRepositoryImpl (data/repositories/login_repository_impl.dart)**

```dart
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> loginUser(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);
      return Right(response.toEntity());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
```

#### **LoginRemoteDataSource (data/data_source/login_remote_data_source.dart)**

```dart
class LoginRemoteDataSource {
  final DioClient dioClient;

  LoginRemoteDataSource(this.dioClient);

  Future<LoginModel> login(String email, String password) async {
    final response = await dioClient.post('/login', data: {
      'email': email,
      'password': password,
    });

    return LoginModel.fromJson(response.data);
  }
}
```

### 3. **Luồng quản lý trạng thái**

- **LoginButtonPressed**: Người dùng nhấn nút đăng nhập trong giao diện.
- **LoginBloc**: Xử lý sự kiện và giao tiếp với use case.
- **LoginUseCase**: Thực hiện logic nghiệp vụ và gọi repository.
- **LoginRepository**: Gửi dữ liệu tới API qua `LoginRemoteDataSource`.
- **Phản hồi API**: Nhận phản hồi, trả dữ liệu hoặc lỗi về repository.
- **Thay đổi trạng thái Bloc**: Cập nhật trạng thái của `LoginBloc` và làm mới giao diện người dùng.

---

## Kết luận

Cấu trúc Clean Architecture đảm bảo rằng dự án được tổ chức rõ ràng, dễ mở rộng và dễ bảo trì. Mỗi lớp có một trách nhiệm cụ thể và độc lập với các lớp khác, giúp mã dễ kiểm thử và mở rộng khi dự án phát triển.
