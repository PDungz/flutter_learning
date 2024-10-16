# Retrofit là gì? 
Retrofit là một thư viện client HTTP dành cho Java và Android, phát triển bởi Square. 
<br><br>
Trong thế giới Flutter, Retrofit cũng được sử dụng thông qua một package Dart được gọi là retrofit, dựa trên thư viện HTTP dio của Dart.
<br><br>
Retrofit giúp việc tương tác với các REST API trở nên dễ dàng và hiệu quả hơn bằng cách sử dụng các annotation để định nghĩa các phương thức HTTP, headers, query parameters, và body của yêu cầu.

# Khái niệm cơ bản về Retrofit trong Flutter
Retrofit trong Flutter sử dụng cách tiếp cận khai báo, nơi bạn định nghĩa một interface với các phương thức tương ứng với các yêu cầu HTTP mà bạn muốn gửi. 
<br><br>
Mỗi phương thức trong interface được anotate bằng các annotation như @GET, @POST, @PUT, v.v., để chỉ định loại yêu cầu HTTP và đường dẫn. Điều này giúp cấu trúc mã nguồn rõ ràng và dễ bảo trì.

# Cài đặt Retrofit trong Flutter 
Để sử dụng Retrofit trong Flutter, bạn vào file <b>pubspec.yaml</b> và thêm các package sau:
<br><br>Thêm 2 package vào tag <b>dependencies</b> pubspec.yaml: 
- <b>retrofit</b>: Thư viện Retrofit cho Dart.
- <b>dio</b>: Thư viện HTTP được sử dụng bởi Retrofit.

<br>Thêm 2 package vào tag <b>dev_dependencies</b>:
- <b>retrofit_generator</b>: thư viện dùng để tự động sinh ra code Dart từ các định nghĩa interface sử dụng annotation cho Retrofit
- <b>build_runner</b>: Công cụ hỗ trợ build tự động cho các dự án Dart và Flutter. Nó chạy các code generator, như retrofit_generator và json_serializable, để sinh code từ các định nghĩa annotation hoặc từ các tệp tài nguyên như JSON.
- <b>json_serializable</b>: thư viện cung cấp cách tiếp cận tự động cho JSON serialization trong Dart. Nó giúp tạo ra mã cho các operation serialization và deserialization một cách tự động dựa trên các định nghĩa của model.

Ví dụ trong file pubspec.yaml:
```yaml
dependencies:
  dio: ^5.7.0
  retrofit: ^4.4.1

dev_dependencies:
  flutter_gen_runner:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0
  retrofit_generator: ^9.1.2
  build_runner: ^2.4.13
  json_serializable: ^6.8.0
```

# Định nghĩa Model class
Định nghĩa model của bạn sử dụng thư viện <b>json_annotation</b> để tự động hóa quá trình serialization và deserialization.

Ví dụ: Tạo một class User trong một tệp riêng biệt và sử dụng nó trong các định nghĩa API của bạn
```dart
import 'package:json_annotation/json_annotation.dart';

// Chỉ định file sẽ dc tạo sau khi gen code. 
// Theo format model_name.g.dart
part 'user.g.dart'; 

@JsonSerializable()
class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  // Factory method để tạo 1 User instance từ 1 Map<String,dynamic>
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Method để convert User thành instance của Map<String, dynamic>
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

# Định nghĩa một API interface
Bạn tạo một interface định nghĩa các phương thức tương tác với API của bạn. 
<br><br>Ví dụ, để gọi một API lấy thông tin người dùng:
```dart
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: "https://api.example.com")
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET("/users/{id}")
  Future<User> getUser(@Path("id") int id);
}
```

# Tạo file generator
Sử dụng build_runner để tạo các file cần thiết cho Retrofit bằng cách chạy:
```bash
flutter pub run build_runner build --delete-conflicting-outputs --verbose
```

# Sử dụng API
Khi đã có file được sinh ra, bạn có thể sử dụng API như sau:
```dart
void main() async {
  final dio = Dio(); // Tạo một instance của Dio
  final userApi = UserApi(dio);

  try {
    User user = await userApi.getUser(1);
    print('User: ${user.name}');
  } catch (e) {
    print(e);
  }
}
```