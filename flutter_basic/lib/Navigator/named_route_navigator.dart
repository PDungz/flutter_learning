//! Ví Dụ 2: Sử Dụng Navigator với Named Routes

import 'package:flutter/material.dart';
import 'package:flutter_basic/Navigator/screens/new_page.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                //! pushNamed
                //? Mở một màn hình mới bằng tên route đã định nghĩa trong MaterialApp.
                // Khi nhấn, nó sẽ gọi Navigator.pushNamed(context, '/new') để mở NewPage thông qua tên route.
                Navigator.pushNamed(context, '/new'); // Sử dụng pushNamed
              },
              child: const Text('Go to New Page'),
            ),
            ElevatedButton(
              onPressed: () {
                // Gửi tham số đến DetailPage
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: 'Hello from Home!',
                );
              },
              child: const Text('Go to Detail Page'),
            )
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
      //! initialRoute
      //? Xác định route ban đầu
      initialRoute: '/',
      //! routes
      //? Trong routes, bạn định nghĩa các route với tên và widget tương ứng
      //? Điểm mạnh:
      //    - Dễ dàng cấu hình và quản lý các route đơn giản.
      //    - Không cần phải xử lý bất kỳ điều gì phức tạp.
      //? Hạn chế:
      //    - Không cho phép bạn tùy chỉnh logic khi điều hướng (ví dụ: thêm dữ liệu vào route hoặc xử lý lỗi).
      routes: {
        '/': (context) => const HomePage(),
        '/new': (context) => const NewPage(),
      },
      //! onGenerateRoute
      //? cho phép bạn viết logic tùy chỉnh cho việc tạo route.
      //? Điều này hữu ích khi bạn cần điều hướng với tham số, xử lý lỗi, hoặc tạo các route động.
      // onGenerateRoute: (RouteSettings settings) {
      //   switch (settings.name) {
      //     case '/':
      //       return MaterialPageRoute(builder: (context) => const HomePage());
      //     case '/new':
      //       return MaterialPageRoute(builder: (context) => const NewPage());
      //     case '/detail':
      //       // Nhận tham số từ arguments
      //       final String data = settings.arguments as String;
      //       return MaterialPageRoute(
      //         builder: (context) => DetailPage(data: data),
      //       );
      //     default:
      //       return MaterialPageRoute(
      //           builder: (context) => const NotFoundPage());
      //   }
      // },
    );
  }
}
