//! Cài đặt đa ngôn ngữ (localization) trong Flutter cho phép ứng dụng của bạn hỗ trợ nhiều ngôn ngữ khác nhau,
//! từ đó cải thiện trải nghiệm người dùng trên toàn cầu

//! Bước 1: Thêm Các Thư Viện Cần Thiết
//? Trước tiên, bạn cần thêm các gói cần thiết vào file pubspec.yaml

// dependencies:
//   flutter:
//     sdk: flutter
//   flutter_localizations:
//     sdk: flutter
//   intl: ^0.17.0

//? Trong đó:
// flutter_localizations: Hỗ trợ Flutter với các ngôn ngữ khác nhau.
// intl: Hỗ trợ việc định dạng ngày tháng, số và các hoạt động quốc tế hóa khác.

//! Bước 2: Cấu Hình Ứng Dụng
//? Cập nhật file lib/main.dart để thêm hỗ trợ đa ngôn ngữ

import 'package:flutter/material.dart';
import 'package:flutter_basic/l10n/generated/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Localization',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}

//! Bước 3: Tạo và Sử Dụng Các File Ngôn Ngữ

// Tạo một thư mục l10n trong thư mục lib và thêm các file ARB (Application Resource Bundle) 
// cho mỗi ngôn ngữ mà bạn muốn hỗ trợ. Ví dụ, bạn có thể tạo các file app_en.arb và app_es.arb cho tiếng Anh và tiếng Tây Ban Nha: