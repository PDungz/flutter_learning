import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Example 3'),
      ),
      body: Center(
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100,
              height: 50,
              color: Colors.red,
              child: const Center(child: Text('Item 1')),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.green,
              child: const Center(child: Text('Item 2')),
            ),
            Container(
              width: 100,
              height: 50,
              color: Colors.blue,
              child: const Center(child: Text('Item 3')),
            ),
          ],
        ),
      ),
    );
  }
}
