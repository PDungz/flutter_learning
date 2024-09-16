//! Row là gì?
//? Row là một widget trong Flutter được sử dụng để xếp các widget con theo chiều ngang (trên cùng một hàng).
//? Mỗi con của Row sẽ được đặt từ trái sang phải theo thứ tự mà chúng được khai báo.

//? Row không cuộn được, vì vậy nếu nội dung vượt quá kích thước chiều ngang của màn hình,
//?  nội dung sẽ bị cắt bớt và gây ra lỗi layout overflow.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row Example'),
        ),
        body: Center(
          child: Column(
            children: [
              //? Aligment
              // Row có thể căn chỉnh các con bên trong theo các trục khác nhau:
              // mainAxis (trục chính, là trục ngang) và crossAxis (trục phụ, là trục dọc).

              //? Các thuộc tính căn chỉnh bao gồm:
              // mainAxisAlignment: Xác định cách phân bổ không gian dọc theo trục chính (ngang).

              //? MainAxisAlignment.start: Bắt đầu từ phía bên trái.
              //? MainAxisAlignment.center: Căn giữa tất cả các con.
              //? MainAxisAlignment.end: Xếp con từ bên phải.
              //? MainAxisAlignment.spaceBetween: Chia đều khoảng cách giữa các con (không có khoảng trống ở đầu và cuối).
              //? MainAxisAlignment.spaceAround: Chia đều khoảng cách giữa các con với khoảng cách vừa phải ở đầu và cuối.
              //? MainAxisAlignment.spaceEvenly: Khoảng cách giữa các con và ở đầu/cuối đều bằng nhau.

              // crossAxisAlignment: Xác định cách căn chỉnh các con dọc theo trục phụ (dọc)
              //? CrossAxisAlignment.start: Căn trên cùng.
              //? CrossAxisAlignment.center: Căn giữa theo chiều dọc.
              //? CrossAxisAlignment.end: Căn dưới cùng.
              const Text('Row with MainAxisAlignment.start'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('1')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Row with MainAxisAlignment.spaceAround'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //? Main Axis Size (Kích thước trục chính)
                // Thuộc tính mainAxisSize xác định liệu Row có nên chiếm toàn bộ không gian ngang có sẵn
                // hay chỉ chiếm không gian vừa đủ cho các con bên trong.
                //? MainAxisSize.min: Chỉ chiếm không gian vừa đủ cho các con.
                //? MainAxisSize.max: Chiếm toàn bộ không gian ngang có sẵn.
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('1')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Row with MainAxisAlignment.spaceBetween'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                    child: const Center(child: Text('1')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Demo Expanded Widget in Row"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                      child: const Center(child: Text('1')),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3')),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Demo Flexible Widget in Row"),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      color: Colors.red,
                      child: const Text('1'),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                    child: const Center(child: Text('2')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue,
                    child: const Center(child: Text('3')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
