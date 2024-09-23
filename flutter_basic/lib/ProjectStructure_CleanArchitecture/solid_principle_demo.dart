//! SOLID là gì?
//? SOLID là một tập hợp các nguyên tắc thiết kế hướng đối tượng

//! SOLID đại diện cho chữ cái đầu của 5 nguyên tắc:
//? - S: Single responsibility principle
//? - O: Open closed Principle
//? - L: Liskov Substitution Principle
//? - I: Interface Segregation Principle
//? - D: Dependency Inversion Principle

//! Single Responsibility Principle - Nguyên tắc trách nhiệm duy nhất

//? Một class chỉ nên có một nhiệm vụ cụ thể.
//? Không nên cố gắng tạo ra các GOD class, tức là một class siêu đa năng đa dụng.
//? => Cân nhắc chia nhỏ các class nhỏ hơn nếu cần thiết.

//? Single Responsibility Principle giúp hạn chế sự phức tạp khi ứng dụng phát triển và giúp dễ dàng bảo trì hơn.

//! Ví dụ:
//? Ví dụ cho thấy class SimpleCalculator đang bị vi phạm nguyên tắc Single Responsibility
//    bởi vì class này là chuyên dùng để tính toán,
//    nhưng lại có thêm hàm printSum, hàm này là không cần thiết nằm trong class
//    và có thể tách thành một class riêng như là ValuePrinter

// class SimpleCalculator {
//   int add(int a, int b) {
//     return a + b;
//   }

//   int divide(int a, int b) {
//     return a ~/ b;
//   }

//   int multiply(int a, int b) {
//     return a * b;
//   }

//   void printSum(int sum) {
//     print(sum);
//   }

//   int substract(int a, int b) {
//     return a - b;
//   }
// }

// class ValuePrinter {
//   void printSum(int sum) {
//     print(sum);
//   }
// }

// void main(List<String> args) {
//   final value = SimpleCalculator().add(1, 2);
//   ValuePrinter().printSum(value);
// }

// //! User chỉ chứa dữ liệu
// class User {
//   final String name;
//   final int age;

//   User(this.name, this.age);
// }

// //! UserManager quản lý các hoạt động liên quan đến người dùng trong database
// class UserManager {
//   void saveUser(User user) {
//     // Lưu thông tin người dùng vào database
//   }

//   void deleteUser(User user) {
//     // Xóa người dùng khỏi database
//   }
// }

// //! UserValidator chịu trách nhiệm xác thực người dùng.
// class UserValidator {
//   bool validateUser(User user) {
//     // Kiểm tra thông tin người dùng
//     return user.name.isNotEmpty && user.age > 0;
//   }
// }

//! Open closed Principle
//? Các object nên cho phép mở rộng nhưng không cho phép điều chỉnh.
//? Có nghĩa là bạn nên mở rộng class để bổ sung thêm các chức năng, chứ đừng chỉnh sửa trực tiếp nó


//! Ví dụ:
//? Shape là một lớp trừu tượng với phương thức area().
//? Rectangle và Circle là những lớp mở rộng từ Shape
//? và chỉ cần triển khai phương thức area() mà không thay đổi lớp Shape

// void printArea(Shape shape) {
//   print("Area is ${shape.area()}");
// }

// class Circle extends Shape {
//   double radius;

//   Circle(this.radius);

//   @override
//   double area() => 3.14159 * radius * radius;
// }

// class Rectangle extends Shape {
//   double width;
//   double height;

//   Rectangle(this.width, this.height);

//   @override
//   double area() => width * height;
// }

// abstract class Shape {
//   double area();
// }

//! Liskov Substitution Principle
//? Các đối tượng của lớp con có thể được thay thế cho đối tượng của lớp cha
//? mà không làm thay đổi tính đúng đắn của chương trình.

//! Ví dụ:
//? Rectangle và Circle đều có thể thay thế cho Shape,
//? và hàm printArea vẫn hoạt động chính xác mà không cần biết đối tượng cụ thể là gì.

// void main() {
//   Shape rectangle = Rectangle(10, 20);
//   Shape circle = Circle(5);

//   printArea(rectangle);
//   printArea(circle);
// }

//! Interface Segregation Principle - Nguyên tắc Tách biệt Interface
//? Không nên ép buộc một lớp phải triển khai các interface mà nó không sử dụng.
//? Nên chia nhỏ các interface lớn thành nhiều interface nhỏ hơn, chuyên biệt hơn.

//! Ví dụ:
//? UserSettings chỉ triển khai các interface cần thiết cho nó.
//? Không có lớp nào bị buộc phải triển khai các phương thức không liên quan đến chức năng cốt lõi của nó.

// abstract class Drawable {
//   void draw();
// }

// abstract class Savable {
//   void save();
// }

// class UserSettings implements Drawable, Savable {
//   @override
//   void draw() {
//     // Vẽ cài đặt người dùng
//   }

//   @override
//   void save() {
//     // Lưu cài đặt người dùng
//   }
// }

//! Dependency Inversion Principle - Nguyên tắc Đảo ngược sự Phụ thuộc
// Các module cấp cao không nên phụ thuộc vào các module cấp thấp. 
// Cả hai nên phụ thuộc vào các abstraction. 
// Các abstraction không nên phụ thuộc vào chi tiết mà chi tiết phải phụ thuộc vào abstraction.

// abstract class UserRepository {
//   User getUser(int id);
//   void saveUser(User user);
// }

// class FirebaseUserRepository implements UserRepository {
//   @override
//   User getUser(int id) {
//     // Lấy người dùng từ Firebase
//     return User(id, 'John Doe');
//   }

//   @override
//   void saveUser(User user) {
//     // Lưu người dùng vào Firebase
//   }
// }

// class UserManager {
//   final UserRepository repository;

//   UserManager(this.repository);

//   void saveUserData(User user) {
//     repository.saveUser(user);
//   }
// }

// class User {
//   final String name;
//   final int id;

//   User( this.id, this.name,);
// }