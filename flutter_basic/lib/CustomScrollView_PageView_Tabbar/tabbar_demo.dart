//! Tabbar
//? TabBar trong Flutter là một widget cho phép bạn tạo một thanh điều hướng chứa nhiều tab,
//? cho phép người dùng chuyển đổi giữa các nội dung khác nhau.
//? TabBar thường được sử dụng trong kết hợp với TabBarView, giúp hiển thị nội dung tương ứng với từng tab.

//! Ví dụ 1: Tabbar cơ bản
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyTabBar()));
}

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),
          //! TabBar
          //? Là widget hiển thị một hàng các tab.
          //? Mỗi tab có thể chứa một tiêu đề hoặc một biểu tượng.
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            //! tabs:
            //? Danh sách các tab sẽ hiển thị trên TabBar. Mỗi tab có thể là một widget như Tab,
            //? cho phép bạn tùy chỉnh tiêu đề hoặc biểu tượng.
            tabs: [
              Tab(
                text: 'Tab 1',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Tab 3',
                icon: Icon(Icons.business),
              ),
              Tab(
                text: 'Tab 4',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Tab 5',
                icon: Icon(Icons.business),
              ),
              Tab(
                text: 'Tab 6',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Tab 7',
                icon: Icon(Icons.business),
              ),
              Tab(
                text: 'Tab 8',
                icon: Icon(Icons.business),
              ),
            ],
            //! isScrollable
            //? Nếu đặt thành true, các tab sẽ có thể cuộn nếu có quá nhiều tab để vừa với màn hình. Mặc định là false.
            isScrollable: true,
            //! indicator
            //? Widget cho phép bạn tùy chỉnh cách hiển thị chỉ báo dưới các tab đang được chọn
            //? (ví dụ: một đường viền, một hình chữ nhật, v.v.).
            // indicator: BoxDecoration(
            //   color: Colors.blue,
            //   borderRadius: BorderRadius.circular(8),
            // ),
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        //! TabBarView
        //? Là widget cho phép hiển thị nội dung tương ứng với mỗi tab. Nó thường được sử dụng cùng với TabBar
        body: TabBarView(
          children: [
            Container(
                color: Colors.amber,
                child: const Center(child: Text('Content for Tab 1'))),
            Container(
                color: Colors.blue,
                child: const Center(child: Text('Content for Tab 2'))),
            Container(
                color: Colors.red,
                child: const Center(child: Text('Content for Tab 3'))),
            Container(
                color: Colors.blue,
                child: const Center(child: Text('Content for Tab 4'))),
            Container(
                color: Colors.red,
                child: const Center(child: Text('Content for Tab 5'))),
            Container(
                color: Colors.red,
                child: const Center(child: Text('Content for Tab 6'))),
            Container(
                color: Colors.blue,
                child: const Center(child: Text('Content for Tab 7'))),
            Container(
                color: Colors.red,
                child: const Center(child: Text('Content for Tab 8'))),
          ],
        ),
      ),
    );
  }
}

//! Ví dụ 2: TabBar với TabController
//? TabBar kết hợp với TabController trong Flutter
//? cho phép bạn điều khiển các tab và hiển thị nội dung tương ứng cho mỗi tab.

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(home: MyTabBar()));
// }

// class MyTabBar extends StatefulWidget {
//   const MyTabBar({super.key});

//   @override
//   State<MyTabBar> createState() => _MyTabBarState();
// }

// class _MyTabBarState extends State<MyTabBar>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TabBar Example'),
//         bottom: TabBar(
//           controller: _tabController, // Kết nối TabBar với TabController
//           tabs: const [
//             Tab(text: 'Tab 1'),
//             Tab(text: 'Tab 2'),
//             Tab(text: 'Tab 3'),
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: TabBarView(
//                 controller:
//                     _tabController, // Kết nối TabBarView với TabController
//                 children: [
//                   Container(
//                       color: Colors.amber,
//                       child: const Center(child: Text('Content for Tab 1'))),
//                   Container(
//                       color: Colors.blue,
//                       child: const Center(child: Text('Content for Tab 2'))),
//                   Container(
//                       color: Colors.red,
//                       child: const Center(child: Text('Content for Tab 3'))),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _goToPreviousPage,
//                   child: const Text('Previous'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _goToNextPage,
//                   child: const Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // Giải phóng TabController khi không còn sử dụng
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Khởi tạo TabController với số lượng tab và vsync
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   void _goToNextPage() {
//     if (_tabController.index < 2) {
//       // Giới hạn số trang
//       _tabController
//           .animateTo(_tabController.index + 1); // Chuyển đến tab tiếp theo
//     }
//   }

//   void _goToPreviousPage() {
//     if (_tabController.index > 0) {
//       // Giới hạn số trang
//       _tabController
//           .animateTo(_tabController.index - 1); // Chuyển đến tab trước
//     }
//   }
// }
