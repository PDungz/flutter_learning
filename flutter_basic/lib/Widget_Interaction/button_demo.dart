//! Button trong Flutter
//? Button là một phần quan trọng trong giao diện người dùng (UI),
//? cho phép người dùng tương tác với ứng dụng
//? bằng cách nhấn vào các thành phần giao diện

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class ButtonDemoScreen extends StatelessWidget {
  const ButtonDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //! Các loại Button
            // Flutter cung cấp nhiều loại widget button để đáp ứng các nhu cầu giao diện khác nhau

            //! ElevatedButton
            //? Một nút nổi lên với hiệu ứng đổ bóng, giúp nó nổi bật hơn trên nền.
            ElevatedButton(
              onPressed: () {
                // Code to execute when the button is pressed
              },
              //? thuộc tính style cho phép bạn tùy chỉnh màu sắc nền, màu chữ, hình dạng và nhiều thuộc tính khác.
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Màu chữ
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Hình dạng
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // Khoảng cách bên trong
              ),
              child: const Text('Elevated Button'),
            ),

            //! TextButton
            //? Một nút đơn giản, không có hiệu ứng nổi hoặc đổ bóng.
            //? Thường được sử dụng cho các hành động đơn giản mà không yêu cầu nổi bật.
            TextButton(
              onPressed: () {
                // Code to execute when the button is pressed
              },
              //? thuộc tính style để tùy chỉnh màu sắc chữ, màu nền, và nhiều thuộc tính khác.
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.grey[200], // Màu nền
                padding: const EdgeInsets.all(16), // Khoảng cách bên trong
                textStyle: const TextStyle(fontSize: 18), // Kích thước chữ
              ),
              child: const Text('Text Button'),
            ),

            //! OutlinedButton
            //? Một nút có viền bao quanh và không có hiệu ứng nổi.
            //? Thường được dùng để tạo sự phân biệt mà không cần hiệu ứng nổi bật.
            OutlinedButton(
              onPressed: () {
                // Code to execute when the button is pressed
              },
              //? thuộc tính style cho phép tùy chỉnh màu viền, màu chữ, hình dạng, và nhiều thuộc tính khác.
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                side: const BorderSide(
                    color: Colors.blue, width: 2), // Màu và độ dày viền
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Hình dạng
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // Khoảng cách bên trong
              ),
              child: const Text('Outlined Button'),
            ),

            //! IconButton
            //? Một nút chỉ có biểu tượng, không có văn bản.
            //? Thường được dùng trong các thanh công cụ hoặc menu.
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                // Code to execute when the button is pressed
              },
              iconSize: 30, // Kích thước biểu tượng
            ),

            //! InkWell
            //? Được thiết kế để custom hình dáng của Button và
            //? hiệu ứng splash khi người dùng chạm vào widget.
            InkWell(
              onTap: () {
                // Code to execute when the button is pressed
              },
              splashColor: Colors.red.withOpacity(0.2), // Màu splash effect
              highlightColor: Colors.transparent,
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue), // Màu nền
                  borderRadius: BorderRadius.circular(12), // Hình dạng
                ),
                child: const Text(
                  'Custom InkWell Button',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          //! FloatingActionButton
          //? Một nút nổi với hình tròn hoặc vuông dc bo góc, thường được đặt ở góc dưới bên phải của ứng dụng.
          //? Thường được sử dụng cho các hành động chính như thêm, tạo mới.
          FloatingActionButton(
        onPressed: () {
          // Code to execute when the button is pressed
        },
        //? backgroundColor
        backgroundColor: Colors.blue, // Màu nền
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonDemoScreen(),
    );
  }
}
