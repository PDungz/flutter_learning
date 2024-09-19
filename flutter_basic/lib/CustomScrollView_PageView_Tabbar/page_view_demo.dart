//! PageView
//? PageView trong Flutter là một widget cho phép người dùng cuộn qua nhiều trang (hoặc phần tử)
//? bằng cách vuốt hoặc cuộn

//! Ví dụ 1: Sử dụng PageView cơ bản
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: MyPageView()));
// }

// class MyPageView extends StatelessWidget {
//   const MyPageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('PageView Example')),
//       body: PageView(
//         //! scrollDirection
//         //? Xác định hướng cuộn của PageView. Mặc định là Axis.horizontal (cuộn ngang).
//         //? Bạn có thể thiết lập thành Axis.vertical để cuộn dọc.
//         scrollDirection: Axis.horizontal,
//         //! children
//         //? Danh sách các widget con mà PageView sẽ hiển thị. Mỗi widget trong danh sách đại diện cho một trang.
//         children: <Widget>[
//           Container(
//               color: Colors.red,
//               child: const Center(
//                   child: Text('Page 1',
//                       style: TextStyle(color: Colors.white, fontSize: 30)))),
//           Container(
//               color: Colors.green,
//               child: const Center(
//                   child: Text('Page 2',
//                       style: TextStyle(color: Colors.white, fontSize: 30)))),
//           Container(
//               color: Colors.blue,
//               child: const Center(
//                   child: Text('Page 3',
//                       style: TextStyle(color: Colors.white, fontSize: 30)))),
//         ],
//         onPageChanged: (int page) {
//           print('Current page: ${page + 1}');
//         },
//       ),
//     );
//   }
// }

//! Ví dụ 2: Sử dụng PageView với PageController
//? sử dụng PageView trong Flutter với PageController.
//? Ví dụ này sẽ cho phép bạn điều khiển chuyển đổi giữa các trang bằng cách sử dụng nút bấm.

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyPageView()));
}

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Để theo dõi trang hiện tại

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageView Example')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: <Widget>[
                  Container(
                      color: Colors.red,
                      child: const Center(
                          child: Text('Page 1',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30)))),
                  Container(
                      color: Colors.green,
                      child: const Center(
                          child: Text('Page 2',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30)))),
                  Container(
                      color: Colors.blue,
                      child: const Center(
                          child: Text('Page 3',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30)))),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: _goToPreviousPage,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: _goToNextPage,
                  child: const Text('Next'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                  onPressed: () => _goToIndicatedPage(2),
                  child: const Text('Go to indicated page'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose(); // Giải phóng tài nguyên của PageController
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round(); // Cập nhật trang hiện tại
      });
    });
  }

  void _goToIndicatedPage(int page) {
    if (page > 0 && page <= 2) {
      _pageController.animateToPage(page,
          duration: const Duration(seconds: 3), curve: Curves.easeIn);
    }
  }

  void _goToNextPage() {
    if (_currentPage < 2) {
      // Giới hạn số trang
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      // Giới hạn số trang
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
