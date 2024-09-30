import 'package:flutter/material.dart';

class ForgotPasswordSection extends StatelessWidget {
  final void Function()? onPressed;
  const ForgotPasswordSection({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            'Forgot password?',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xffFF8036)),
          ),
        ),
      ),
    );
  }
}
