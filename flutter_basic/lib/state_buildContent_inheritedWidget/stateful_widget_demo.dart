//! Stateful Widget là gì?
// StatefulWidget là một loại widget có trạng thái.

// StatefulWidget có thể thay đổi trạng thái trong suốt vòng đời của nó

//! State là gì?
// State là nơi lưu trữ thông tin trạng thái của StatefulWidget.
// Bạn có thể thay đổi trạng thái này bằng cách gọi phương thức setState(),
// và khi trạng thái thay đổi,
// Flutter sẽ tự động cập nhật giao diện người dùng để phản ánh sự thay đổi đó.

// ví dụ các trạng thái thời tiết
//  - Trời nắng, nhiệt độ 34 độ, gió đứng
//  - Trời mưa, nhiệt độ 24 độ, gió giật mạnh
//  - Trời âm u, nhiệt độ 29 độ, gió nhẹ
//? Lúc này trong State Object sẽ có 3 thuộc tính có thể thay đổi:
//?   - WeatherCondition: Trời nắng, Trời mưa, Trời âm u
//?   - TemperatureDegree: 34, 24, 29
//?   - WindCondition: gió đứng, gió giật mạnh, gió nhẹ

//! StatefulWidget gồm hai lớp chính:

import 'package:flutter/material.dart';
import 'package:flutter_basic/state_buildContent_inheritedWidget/stateful_widget_life_cycle.dart';

//?   Lớp StatefulWidget:
//?     - Là Class chính kế thừa từ StatefulWidget
//?     - và sẽ override lại hàm createState
class MyStatefulWidget1 extends StatefulWidget {
  const MyStatefulWidget1({super.key});

  @override
  State<MyStatefulWidget1> createState() => _MyStatefulWidget1State();
}

//?   Lớp State:
//?     - Là class đính kèm có dấu _ để thể hiện private trong file
//?     - kế thừa từ State với generic là class chính.
//?     - Sau đó override lại hàm build
//?   Lớp State lưu trữ và quản lý trạng thái của widget.
class _MyStatefulWidget1State extends State<MyStatefulWidget1> {
  //? _MyStatefulWidgetState lưu trữ một biến _counter.
  //? Khi người dùng nhấn vào nút, phương thức _incrementCounter được gọi,
  //? sẽ cập nhật giá trị _counter
  //? và gọi setState() để làm mới giao diện với giá trị mới của _counter.
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Screen 1'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter',
                style: Theme.of(context).textTheme.headlineMedium),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyStatefulWidget2()));
                },
                child: const Text("Go to Screen 2"))
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

  void _incrementCounter() {
    /*
?     setState() được gọi khi trạng thái của widget thay đổi 
?     và bạn muốn thông báo Flutter để xây dựng lại giao diện với trạng thái mới. 
?     Việc gọi setState() sẽ khiến build() được gọi lại để cập nhật giao diện.
     */
    setState(() {
      _counter++;
    });
  }
}
