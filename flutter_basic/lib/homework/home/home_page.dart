import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/homework/home/components/infor_detail.dart';
import 'package:flutter_basic/homework/home/components/infor_main_weather.dart';
import 'package:flutter_basic/homework/home/components/temp_locale_weather.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Mở rộng phần thân dưới AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Làm cho AppBar trong suốt
        elevation: 0, // Xóa bỏ bóng của AppBar
        shadowColor: Colors.black.withOpacity(0.8),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/weather_page');
          },
          icon: const Icon(
            CupertinoIcons.bars,
            color: Colors.white,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 54),
          child: Center(
            child: Text(
              '10.82, 205.24',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Image as background for the entire screen, including behind the AppBar
          Positioned.fill(
            child: Image.asset(
              'assets/images/morning.jpg', // Đường dẫn tới hình ảnh trong thư mục assets
              fit: BoxFit.cover, // Đảm bảo hình ảnh phủ toàn bộ màn hình
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 100),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TempLocaleWeather(),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          InforMainWeather(),
                          SizedBox(height: 16),
                          InforDetail(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), // Your other content can go here
        ],
      ),
    );
  }
}
