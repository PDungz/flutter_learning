import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyTextFieldExample(),
  ));
}

class MyTextFieldExample extends StatelessWidget {
  //! TextEditingController
  //? Đối tượng TextEditingController quản lý văn bản được nhập vào.
  final TextEditingController _controller = TextEditingController();

  //! FocousNode
  //? Đối tượng FocusNode quản lý trạng thái lấy nét của TextField.
  final FocusNode _focusNode = FocusNode();

  MyTextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              //! controller
              //? Truyền đối tượng TextEditingController vào TextField để lấy giá trị của TextField
              //? hoặc thay đổi văn bản của TextField.
              controller: _controller,

              //! focusNode
              //? Truyền đối tượng FocusNode để theo dõi và quản lý khi TextField được lấy nét hoặc mất nét.
              focusNode: _focusNode,

              //! decoration
              //? Cung cấp các thuộc tính để trang trí TextField, như label, icon, và border.
              decoration: InputDecoration(
                labelText: 'Enter text',
                hintText: 'Type something...',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.text_fields),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),

              //! keyboardType
              //? Loại bàn phím hiển thị khi TextField được chọn.
              keyboardType: TextInputType.text,

              //! textInputAction
              //? Hành động của phím Enter/Return trên bàn phím.
              textInputAction: TextInputAction.done,

              //! obscureText
              //? Ẩn văn bản nhập vào (thường dùng cho mật khẩu).
              obscureText: false,

              //! maxLength
              //? Đặt giới hạn số lượng ký tự người dùng có thể nhập.
              maxLength: 100,

              //! onChanged
              //? Callback khi chữ trong TextField thay đổi.
              onChanged: (text) {
                print('Text changed: $text');
              },

              //! onSubmitted
              //? Callback khi người dùng nhấn phím Enter/Return.
              onSubmitted: (text) {
                print('Text submitted: $text');
              },

              //! style
              //? Tùy chỉnh style chữ bên trong TextField.
              style: const TextStyle(fontSize: 18, color: Colors.black),

              //! cursorColor
              //? Màu sắc của con trỏ văn bản.
              cursorColor: Colors.blue,
            ),
            ElevatedButton(
                onPressed: () {
                  _focusNode.unfocus();
                },
                child: const Text("Unfocus textfield")),
            ElevatedButton(
                onPressed: () {
                  print(
                      "Value hiện tại của TextField là gì: ${_controller.text}");
                },
                child: const Text("Get value of TextField"))
          ],
        ),
      ),
    );
  }
}
