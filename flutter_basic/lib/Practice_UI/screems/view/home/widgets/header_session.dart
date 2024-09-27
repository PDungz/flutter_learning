import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_basic/Practice_UI/screems/core/routers/app_routers.dart';
import 'package:flutter_basic/Practice_UI/screems/view/home/widgets/option_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderSession extends StatelessWidget {
  final bool isLogin;
  const HeaderSession({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.only(
            top: statusBarHeight + 12,
            bottom: 12,
            left: 6,
            right: 16,
          ),
          decoration: BoxDecoration(
            color:
                const Color(0xff1F293D).withOpacity(0.8), // Màu bán trong suốt
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/logo/Logo.svg",
                height: 48,
                width: 48,
              ),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OptionItem(
                      svgPath: "assets/icons/Location.svg",
                      title: "Nur-Sultan",
                    ),
                    SizedBox(width: 20),
                    OptionItem(
                      svgPath: "assets/icons/Language.svg",
                      title: "Eng",
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ), // Custom padding
                ),
                onPressed: () => Navigator.pushNamed(context, AppRouters.login),
                child: const Text(
                  "Log in",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
