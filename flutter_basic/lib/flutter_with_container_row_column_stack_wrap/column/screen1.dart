import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Example 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
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
