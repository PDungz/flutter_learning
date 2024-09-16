import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

//! Container: là Widget được sử dụng rất nhiều trong Flutter.
//? Container dùng như 1 view để chứa phần tử con bên trong.
//? Có thể chỉ được chiều cao, chiều rộng, màu sắc, bo góc, căn chỉnh

// class DemoContainer extends StatelessWidget {
//   const DemoContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         color: Colors.red,
//         child: Container(
//           margin: const EdgeInsets.all(32),
//           padding: const EdgeInsets.all(16),
//           color: Colors.yellow,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: Colors.black,
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const DemoContainer(),
//     );
//   }
// }

//! Đặc tính auto layout của container

//? 1. Container có size:
// Khi bạn đặt kích thước cố định cho một Container bằng các thuộc tính như width, height,
// nó sẽ có kích thước đó
// trừ khi thành phần cha đã đặt kích thước cho nó.
// Trong trường hợp đó, Container sẽ tuân theo kích thước của cha và không giữ được kích thước ban đầu.

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Container có size'),
//         ),
//         body: Center(
//           child:
//               // Container có kích thước cố định 200x200.
//               // Nó tự định hình được nếu không có cha điều chỉnh kích thước của nó.
//               Container(
//             width: 200, // Container có kích thước 200x200
//             height: 200,
//             color: Colors.blue,
//             child: const Center(
//               child: Text(
//                 'Container có size',
//                 style: TextStyle(color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//? 2. Container không size, không con → lấy kích thước lớn nhất có thể
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Container không size, không con'),
//         ),
//         body: Center(
//           child: Container(
//             color: Colors.red, // Container không có kích thước cụ thể
//           ),
//         ),
//       ),
//     );
//   }
// }

//? 3. Container không size, có con không size → Container thu nhỏ theo con

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Container có con không size'),
//         ),
//         body: Center(
//           child: Container(
//             color: Colors.green, // Container không có kích thước cụ thể
//             child: const Text('Con không có size'),
//           ),
//         ),
//       ),
//     );
//   }
// }

//? 4. Container không size, có con có size → Container thu nhỏ theo con
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Container có con có size'),
//         ),
//         body: Center(
//           child: Container(
//             color: Colors.yellow,
//             child: Container(
//               width: 150, // Con có size cố định
//               height: 100,
//               color: Colors.blue,
//               child: const Center(
//                 child: Text(
//                   'Con có size',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//? 5. Container không size, cha có size → size con follow theo cha
// Container bên ngoài có kích thước cố định 300x300.
// Bất kể con bên trong có kích thước hay không, nó sẽ bị kéo theo và hiển thị trong kích thước của cha.
// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Container có cha có size'),
//         ),
//         body: Center(
//           child: Container(
//             width: 300, // Cha có kích thước cố định
//             height: 300,
//             color: Colors.orange,
//             child: Container(
//               color: Colors.purple,
//               child: const Text(
//                 'Con được kéo theo',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//? 6. Container có size, cha có size → size con luôn theo cha
// Cả cha và con đều có kích thước cố định.
// Cha có kích thước 400x400 và con có kích thước 200x200,
// vì vậy size con luôn theo cha.

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container có size, cha có size'),
        ),
        body: Center(
          child: Container(
            width: 400, // Cha có kích thước cố định
            height: 400,
            color: Colors.grey,
            child: Container(
              width: 200, // Con cũng có kích thước cố định
              height: 200,
              color: Colors.teal,
              child: const Center(
                child: Text(
                  'Con có size',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
