import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.bgColor,
    required this.primaryColor,
  });

  final Color bgColor;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 40, // Adjusted height for better appearance
      color: bgColor,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12, right: 42),
            child: HeaderText("Time"),
          ),
          HeaderText("Adult"),
          HeaderText("Child"),
          HeaderText("Student"),
          HeaderText("VIP"),
        ],
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF637394)),
      ),
    );
  }
}
