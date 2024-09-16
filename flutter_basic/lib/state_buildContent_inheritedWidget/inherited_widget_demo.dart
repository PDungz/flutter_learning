//! Inherited Widget
// InheritedWidget là một loại widget đặc biệt trong Flutter
// mà bạn thường sử dụng để cung cấp dữ liệu từ một widget tổ tiên
// xuống cho các widget con trong cây widget.

// Dữ liệu từ InheritedWidget có thể được truy cập bởi bất kỳ widget con nào
//? thông qua phương thức of(context).

//! Khi Nào Sử Dụng InheritedWidget
//?    - Khi bạn có dữ liệu hoặc trạng thái mà bạn muốn chia sẻ với nhiều widget con
//?      mà không cần phải truyền dữ liệu qua từng widget trung gian.

//?    - Khi bạn muốn đảm bảo rằng khi dữ liệu thay đổi, các widget con sẽ tự động cập nhật.

//! Cách Hoạt Động
//? 1. Tạo InheritedWidget:
//  Định nghĩa lớp kế thừa từ InheritedWidget và cung cấp dữ liệu thông qua thuộc tính.

//? 2. Cung Cấp Dữ Liệu:
//  Bọc các widget con trong InheritedWidget để cung cấp dữ liệu.

//? 3. Truy Cập Dữ Liệu:
//  Các widget con sử dụng phương thức of(context) để truy cập dữ liệu từ InheritedWidget.

import 'package:flutter/material.dart';

//! 3. Sử Dụng ConfigProvider và Truy Cập Dữ Liệu:
void main() {
  runApp(const MaterialApp(
    home: ConfigProvider(
      child: MyHomePage(),
    ),
  ));
}

//!  1. Tạo InheritedWidget
// InheritedWidget để cung cấp dữ liệu cấu hình
class ConfigInheritedWidget extends InheritedWidget {
  final String config;

  const ConfigInheritedWidget({
    Key? key,
    required this.config,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(ConfigInheritedWidget oldWidget) {
    return config != oldWidget.config;
  }

  // Phương thức để truy cập dữ liệu từ widget con
  static ConfigInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ConfigInheritedWidget>();
  }
}

//! 2. Tạo Widget Quản Lý Trạng Thái
class ConfigProvider extends StatefulWidget {
  final Widget child;

  const ConfigProvider({Key? key, required this.child}) : super(key: key);
  @override
  State<ConfigProvider> createState() => _ConfigProviderState();
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final config = ConfigInheritedWidget.of(context)?.config ?? 'DefaultConfig';

    return Scaffold(
      appBar: AppBar(
        title: const Text('InheritedWidget Example'),
      ),
      body: Center(
        child: Text('Config: $config'),
      ),
    );
  }
}

class _ConfigProviderState extends State<ConfigProvider> {
  String _config = 'InitialConfig';

  @override
  Widget build(BuildContext context) {
    return ConfigInheritedWidget(
      config: _config,
      child: Column(
        children: [
          Expanded(child: widget.child),
          SafeArea(
            top: false,
            child: ElevatedButton(
              onPressed: () {
                _updateConfig('UpdatedConfig'); // Cập nhật giá trị cấu hình
              },
              child: const Text('Update Config'),
            ),
          ),
        ],
      ),
    );
  }

  void _updateConfig(String newConfig) {
    setState(() {
      _config = newConfig;
    });
  }
}
