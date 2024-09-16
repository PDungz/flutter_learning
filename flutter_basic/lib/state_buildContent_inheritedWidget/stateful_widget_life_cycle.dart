//! Vòng đời của StatefulWidget
// Vòng đời của một StatefulWidget bao gồm nhiều giai đoạn và các phương thức tương ứng

// Đây là nơi tốt để thực hiện các khởi tạo cần thiết,
// chẳng hạn như khởi tạo biến trạng thái hoặc đăng ký lắng nghe sự kiện.

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_basic/state_buildContent_inheritedWidget/stateful_widget_demo.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget1(),
    );
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({super.key});

  //! Giai đoạn 1: Tạo Widget
  //  Phương thức createState() được gọi khi widget được tạo.
  //  Nó trả về một đối tượng State để quản lý trạng thái của widget.
  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidget2State();
}

class _MyStatefulWidget2State extends State<MyStatefulWidget2> {
  int _counter = 0;

  //! Giai đoạn 3: Xây dựng Widget
  // Phương thức build(BuildContext context) được gọi mỗi khi
  // trạng thái của widget thay đổi hoặc khi cần xây dựng lại giao diện.
  // Đây là nơi bạn định nghĩa cách widget sẽ hiển thị dựa trên trạng thái hiện tại.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter',
                style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  //! Giai đoạn cuối: Dọn dẹp

  //? deactivate() được gọi khi widget bị loại bỏ khỏi cây widget
  //  nhưng có thể được xây dựng lại sau đó.
  //  Phương thức này thường được sử dụng
  //  để thực hiện các dọn dẹp nhẹ nhàng hoặc hủy bỏ các lắng nghe sự kiện liên quan đến widget.

  // Sử dụng thực tế: Thường không cần phải ghi đè phương thức này,
  // nhưng có thể sử dụng để thực hiện các tác vụ dọn dẹp nhẹ nhàng
  // trước khi widget bị hủy hoàn toàn.
  @override
  void deactivate() {
    print("[MyStatefulWidget2] Deactive is triggered");
    super.deactivate();
  }

  //? dispose() được gọi khi widget bị hủy hoàn toàn và không còn được sử dụng nữa.
  //  Đây là thời điểm bạn nên thực hiện dọn dẹp cuối cùng,
  //  chẳng hạn như giải phóng các tài nguyên và hủy các đối tượng lắng nghe sự kiện.
  @override
  void dispose() {
    // Thực hiện dọn dẹp tài nguyên nếu cần
    print("[MyStatefulWidget2] dispose is triggered");
    super.dispose();
  }

  //! Giai đoạn 2: Khởi tạo State
  // initState(): Phương thức này được gọi ngay sau khi đối tượng State được tạo
  // và trước khi widget được xây dựng lần đầu tiên
  @override
  void initState() {
    print("[MyStatefulWidget2] initState is triggered");
    super.initState();
    // Thực hiện khởi tạo cần thiết
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
