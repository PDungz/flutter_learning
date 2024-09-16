import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/flutter_with_container_row_column_stack_wrap/homework/weathers/components/card_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

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
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
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
              'assets/images/evening.jpg', // Đường dẫn tới hình ảnh trong thư mục assets
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
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          CardWeather(
                            imageBgUrl: 'assets/images/morning.jpg',
                            nameCity: 'Hà Nội City',
                            time: '6:00',
                            weather: 'Sunny',
                            imageUrl: 'assets/images/weathers/clear.png',
                            temp: '32°C',
                          ),
                          SizedBox(height: 12),
                          CardWeather(
                            imageBgUrl: 'assets/images/evening.jpg',
                            nameCity: 'Hồ Chí Minh City',
                            time: '9:00',
                            weather: 'Sunny',
                            imageUrl: 'assets/images/weathers/clear.png',
                            temp: '32°C',
                          ),
                          SizedBox(height: 12),
                          CardWeather(
                            imageBgUrl: 'assets/images/morning.jpg',
                            nameCity: 'Hồ Chí Minh City',
                            time: '9:00',
                            weather: 'Sunny',
                            imageUrl: 'assets/images/weathers/clear.png',
                            temp: '32°C',
                          ),
                          SizedBox(height: 12),
                          CardWeather(
                            imageBgUrl: 'assets/images/evening.jpg',
                            nameCity: 'Hồ Chí Minh City',
                            time: '9:00',
                            weather: 'Sunny',
                            imageUrl: 'assets/images/weathers/clear.png',
                            temp: '32°C',
                          ),
                          SizedBox(height: 12),
                          CardWeather(
                            imageBgUrl: 'assets/images/evening.jpg',
                            nameCity: 'Hồ Chí Minh City',
                            time: '9:00',
                            weather: 'Sunny',
                            imageUrl: 'assets/images/weathers/clear.png',
                            temp: '32°C',
                          ),
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
