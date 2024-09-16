//! Wiget Text là gì?
/*
?   Trong Flutter, Text là widget phổ biến và cơ bản nhất 
?   dùng để hiển thị chuỗi ký tự (text) trên giao diện người dùng.
*/

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: InkWell(
            //! Các thuộc tính chính của Text widget
            child: Text(
              //? data
              // data là chuỗi văn bản mà widget sẽ hiển thị.
              // Đây là tham số bắt buộc, được truyền vào ngay khi khởi tạo Text.
              'This is Flutter Text Widget! with very long text',
              //? style
              // style cho phép bạn định dạng văn bản theo ý muốn thông qua TextStyle.
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                letterSpacing: 2,
                wordSpacing: 4,
              ),
              //? textAlign
              // textAlign xác định cách văn bản được căn chỉnh theo chiều ngang
              //  - TextAlign.left: Căn lề trái
              //  - TextAlign.right: Căn lề phải
              //  - TextAlign.center: Căn giữa
              //  - TextAlign.justify: Căn đều 2 bên.
              // textAlign: TextAlign.center,
              //? maxLines
              // Giới hạn số dòng hiển thị cho văn bản. Nếu văn bản dài hơn số dòng đã định,
              // phần còn lại sẽ bị cắt hoặc hiển thị dấu ba chấm tùy thuộc vào thuộc tính overflow.
              maxLines: 1,
              //? overflow
              // overflow điều khiển cách xử lý văn bản khi nó vượt quá không gian hiển thị
              //  - TextOverflow.clip: Cắt văn bản
              //  - TextOverflow.ellipsis: Thêm dấu ba chấm "..." khi văn bản quá dài
              //  - TextOverflow.fade: Làm mờ dần văn bản
              overflow: TextOverflow.ellipsis,
              //? softWrap
              // Xác định có nên ngắt dòng văn bản khi hết không gian hay không.
              // Nếu softWrap là false, văn bản sẽ tiếp tục nằm trên cùng một dòng
              // và bị cắt nếu vượt quá không gian.
              //! chỉ có thể sử dụng softWrap: true khi ko chỉ định maxLine và overflow
              // softWrap: true,
              //? textDirection: chỉ định hướng của văn bản
              //  - TextDirection.ltr: Văn bản từ trái sang phải (mặc định).
              //  - TextDirection.rtl: Văn bản từ phải sang trái (thường dùng cho các ngôn ngữ như tiếng Ả Rập).
              textDirection: TextDirection.ltr,
              //? textScaleFactor: cho phép bạn điều chỉnh tỷ lệ kích thước của văn bản
              textScaleFactor: 1.5, // Tăng kích thước văn bản lên 1.5 lần
            ),
          ),
        ),
      ),
    );
  }
}
