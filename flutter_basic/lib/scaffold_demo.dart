//! Widget Scaffold là gì
// Scaffold là một widget cơ bản trong Flutter,
// cung cấp một khung sườn để xây dựng giao diện người dùng cho các ứng dụng mobile.

// Scaffold cung cấp cấu trúc và bố cục chuẩn cho một trang, bao gồm:
//  - thanh công cụ (app bar),
//  - thanh điều hướng dưới cùng (bottom navigation bar),
//  - ngăn kéo (drawer),
//  - body: nội dung chính.

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final pageview1Controller = PageController(initialPage: 0);
  final pageview2Controller = PageController(initialPage: 0);
  final pageViewOneChildren = [
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        "Home Tabbar",
        style: TextStyle(color: Colors.white),
      ),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text(
        "Settings",
        style: TextStyle(color: Colors.white),
      ),
    ),
    Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: const Text(
        "Profile",
      ),
    ),
  ];
  final pageViewTwoChildren = [
    Container(
      color: Colors.deepPurple,
      alignment: Alignment.center,
      child: const Text(
        "Home Bottom Bar",
        style: TextStyle(color: Colors.white),
      ),
    ),
    Container(
      color: Colors.orange,
      alignment: Alignment.center,
      child: const Text(
        "Business",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //! appBar
        // appBar là một AppBar widget,
        // thường được hiển thị ở đầu trang và chứa:
        //  - tiêu đề của trang,
        //  - các hành động,
        //  - có thể có một ngăn kéo điều hướng (drawer toggle).
        appBar: AppBar(
          //! title
          // Thuộc tính title thường là một widget Text hiển thị tiêu đề của ứng dụng hoặc trang hiện tại
          title: const Text('My Home Page'),
          //! actions
          // Thuộc tính actions cho phép bạn đặt một danh sách các widget (thường là các IconButton)
          // mà người dùng có thể tương tác, thường được sử dụng cho các hành động như
          // tìm kiếm, chia sẻ, hoặc mở cài đặt.
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          //! leading
          // Widget leading thường là một biểu tượng menu (hamburger menu)
          // hoặc mũi tên trở lại, tùy thuộc vào ngữ cảnh của ứng dụng.
          // Nếu không được chỉ định, Flutter sẽ tự động thêm một nút để mở Drawer nếu Scaffold có một Drawer.
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          //! backgroundColor: Đặt màu nền cho AppBar.
          backgroundColor: Colors.amber,
          //! bottom
          // Thuộc tính bottom thường được sử dụng để thêm một TabBar vào AppBar,
          // cho phép người dùng chuyển đổi giữa các tab trong ứng dụng.
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.settings)),
              Tab(icon: Icon(Icons.person)),
            ],
            onTap: (index) {
              pageview1Controller.jumpToPage(index);
            },
          ),
        ),
        //! body
        // Phần body của Scaffold là nơi chính để hiển thị nội dung của ứng dụng.
        // Đây là nơi bạn có thể đặt các Widgets như Column, Row, Stack, v.v.
        body: Column(
          children: [
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageview1Controller,
                children: pageViewOneChildren,
              ),
            )),
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageview2Controller,
                children: pageViewTwoChildren,
              ),
            )),
          ],
        ),
        //! floatingActionButton
        // là một nút hành động nổi, thường dùng để thực hiện một hành động.
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        //! drawer
        // drawer là một ngăn kéo điều hướng bên,
        // thường được mở từ một biểu tượng ở góc trên bên trái của AppBar.
        // Nó thường chứa danh sách các lựa chọn điều hướng.
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: const Text('Item 1'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        //! bottomNavigationBar
        // bottomNavigationBar là một thanh điều hướng ở phía dưới của màn hình,
        // cho phép người dùng chuyển đổi giữa các view hoặc chức năng chính của ứng dụng.
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            pageview2Controller.jumpToPage(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
        ),
        //! backgroundColor:
        // Màu nền của Scaffold, có thể được đặt để thay đổi màu nền mặc định.
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
