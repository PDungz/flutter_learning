import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//!  Widget Icon trong Flutter là gì?
// Icon là một widget dùng để hiển thị các icon từ các bộ icon có sẵn,
// chủ yếu là từ Material Design (bộ biểu tượng tiêu chuẩn của Google).

// Icon thường được sử dụng để biểu diễn các hành động,
// trạng thái hoặc thông tin trực quan trong giao diện ứng dụng.
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                //! icon
                // là biểu tượng cần hiển thị, thường được lấy từ thư viện Icons trong Flutter.
                // Bộ Icons cung cấp nhiều biểu tượng phổ biến và dễ sử dụng.
                Icons.home,
                //? color
                // Xác định màu sắc của biểu tượng.
                // Bạn có thể sử dụng bất kỳ màu nào từ lớp Colors hoặc tạo màu tùy chỉnh với Color.
                color: Color(0xff0b03fc),
                // color: Colors.amber,
                //? size
                // Kích thước của biểu tượng, được đo bằng pixel. Mặc định kích thước là 24.0.
                size: 100.0,
                //? textDirection
                // điều chỉnh hướng của biểu tượng.
                // Hữu ích khi làm việc với các ngôn ngữ có hướng từ phải sang trái (RTL) như tiếng Ả Rập hoặc tiếng Do Thái.
                // textDirection: TextDirection.rtl,
              ),
              //! Sử dụng thư viện biểu tượng khác
              // Ngoài các biểu tượng mặc định từ Material Design,
              // bạn có thể sử dụng các bộ biểu tượng khác như CupertinoIcons, Font Awesome
              const Icon(
                CupertinoIcons.home,
                color: Colors.red,
              ),
              //! Kết hợp Icon với các widget khác
              // Icon thường được sử dụng kết hợp với IconButton,
              // là một widget cho phép bạn tạo nút nhấn với biểu tượng thay vì văn bản
              IconButton(
                icon: const Icon(Icons.volume_up),
                color: Colors.green,
                onPressed: () {
                  print('Volume up pressed');
                },
              ),
            ],
          ),
        ),
        //! Icon kết hợp với AppBar
        // Icon thường được sử dụng trong thanh công cụ trên cùng (AppBar), ví dụ như các biểu tượng hành động:
        appBar: AppBar(
          title: const Text('My App'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
