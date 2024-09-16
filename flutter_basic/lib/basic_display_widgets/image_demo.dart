import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//! Image
// Image là một widget trong Flutter dùng để hiển thị hình ảnh.
// Bạn có thể sử dụng Image để tải và hiển thị các hình ảnh từ nhiều nguồn khác nhau như:
//  - từ mạng internet,
//  - từ bộ nhớ cục bộ (assets),
//  - hoặc từ một tệp tin.

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Các phương thức khởi tạo Image
              // Flutter cung cấp nhiều phương thức khởi tạo khác nhau cho widget Image,
              // mỗi phương thức tương ứng với một cách lấy nguồn hình ảnh khác nhau.

              //? Image.asset
              // Phương thức này dùng để tải hình ảnh từ thư mục assets trong dự án.
              // Đây là cách phổ biến nhất khi bạn muốn sử dụng hình ảnh cục bộ (local).
              // Nếu ko chỉ định width và height cho hình Widget Image
              // nó sẽ lấy size gốc của hình để hiển thị
              Image.asset(
                'assets/images/dog.png',
              ),

              //? Image.network
              // Phương thức này dùng để tải hình ảnh từ một URL (từ internet).
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTAcRvCrR6UjBc9HwnLXbCNaFbvg5cJ3M3Mzun7hhxS3cXORPHZ3HMBVutjO_lXA_xsg&usqp=CAU'),

              //! khi lập trình thì sẽ làm việc với 2 loại ảnh là: image và vector. Vector thường được dùng nhất là SVG.
              //! Flutter không có một thư viện built in về vector nên sẽ dùng bên thứ 3.
              //? sử dụng thư viện flutter_svg
              SvgPicture.asset(
                "assets/svg/technical.svg",
                width: 100,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
