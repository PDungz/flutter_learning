//! ThemeData
//? ThemeData trong Flutter là một lớp cung cấp cấu hình và thông tin về chủ đề (theme) cho ứng dụng của bạn
//? ThemeData cho phép bạn xác định cách các widget hiển thị, bao gồm màu sắc, kiểu chữ, và các thuộc tính giao diện khác
//? Sử dụng ThemeData giúp bạn dễ dàng duy trì tính nhất quán trong giao diện ứng dụng.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! Sử dụng AppBarTheme từ ThemeData, với màu nền là Colors.blue và màu chữ là trắng.
      appBar: AppBar(title: const Text('ThemeData Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a themed text.',
              //! Sử dụng Theme.of(context).textTheme.bodyLarge để lấy kiểu chữ cho văn bản.
              //! Kiểu chữ này được định nghĩa trong textTheme.
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            //! Màu nền của nút sẽ sử dụng buttonColor từ buttonTheme, giúp nút hiển thị với màu xanh.
            ElevatedButton(
              onPressed: () {},
              child: const Text('Press Me'),
            ),
            const SizedBox(height: 20),
            //! Sử dụng InputDecorationTheme để cấu hình các trường nhập liệu.
            //! Border và màu viền sẽ được áp dụng theo cấu hình trong ThemeData.
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter your text',
                hintText: 'This is a themed input',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //! primaryColor
        //? là màu chính duy nhất cho ứng dụng. Nó được sử dụng cho các widget như AppBar, FloatingActionButton, và các phần tử khác trong ứng dụng.
        primaryColor: Colors.red,
        //! colorScheme
        //? Đây là một thuộc tính quan trọng mới hơn, cho phép bạn xác định một bảng màu hoàn chỉnh cho ứng dụng.
        //?  Nó bao gồm các màu sắc như primary, secondary, background, surface, error, v.v.
        colorScheme: const ColorScheme.light(
                primary: Colors.blue, secondary: Colors.lightBlue)
            .copyWith(secondary: Colors.orange), // Màu phụ
        //! textTheme
        //? Định nghĩa các kiểu chữ cho các loại văn bản trong ứng dụng.
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        //! appBarTheme
        //? Cấu hình cho AppBar, bao gồm màu nền, màu chữ, và các thuộc tính khác.
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        //! buttonTheme
        //? Cấu hình giao diện cho các nút trong ứng dụng.
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
        //! inputDecorationTheme
        //? Định nghĩa các thuộc tính cho các trường nhập liệu, như màu viền, màu nền và màu nhấn.
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
