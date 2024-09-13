//! BuildContext là gì?
// BuildContext là một đối tượng được truyền cho mỗi widget
// khi build method của widget đó được gọi.

// BuildContext cung cấp thông tin về vị trí của widget trong cây widget
// và cho phép truy cập đến các widget tổ tiên, trạng thái, và dữ liệu.

import 'package:flutter/material.dart';
import 'package:flutter_basic/drawer_section_of_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar Example'),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () => _openDrawer(context),
                child: const Text('Show SnackBar'),
              );
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).showBottomSheet((_) => Container(
                          height: 200,
                          color: Colors.red,
                        ));
                  },
                  child: const Text('Open Modal Bottom Sheet'));
            })
          ],
        ),
      ),
      drawer: const DrawerSection(),
    );
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
