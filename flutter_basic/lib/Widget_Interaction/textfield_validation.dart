//! Để thực hiện validation cho TextField trong Flutter,
//? bạn có thể sử dụng Form và TextFormField

//! Form
//? Form là một widget chứa các TextFormField widgets,

//! TextFormField
//? TextFormField hỗ trợ tích hợp validation
//? và có thể dễ dàng kết hợp với Form để xử lý việc kiểm tra hợp lệ.

//! Các Bước Thực Hiện Validation

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyFormExample(),
  ));
}

class MyFormExample extends StatefulWidget {
  const MyFormExample({Key? key}) : super(key: key);

  @override
  State<MyFormExample> createState() => _MyFormExampleState();
}

class _MyFormExampleState extends State<MyFormExample> {
  //! Bước 1: Tạo GlobalKey<FormState>
  //? Sử dụng GlobalKey<FormState> để quản lý trạng thái của form và thực hiện các hành động như validation.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //! Bước 2: Xử Lý Xác Thực
        //? Sử dụng Form widget để bao bọc các TextFormField,
        //? và gọi phương thức validate() khi cần kiểm tra tính hợp lệ của form.
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //! Bước 3: Tạo TextFormField với Hàm Validation
              //? Sử dụng thuộc tính validator của TextFormField để định nghĩa các điều kiện validation.
              TextFormField(
                //? autovalidateMode
                //? Đặt chế độ tự động validate để validation được thực hiện khi người dùng nhập liệu.
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                //? autovalidateMode
                //? Đặt chế độ tự động validate để validation được thực hiện khi người dùng nhập liệu.
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  //! Gọi hàm validate() dựa trên formKey để validate các giá trị có trong các TextFormField
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
