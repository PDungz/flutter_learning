import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management/login/widgets/sign_in_method_item.dart';

class OtherSignInMethodSection extends StatelessWidget {
  final void Function()? onGoogle;
  final void Function()? onFacebook;

  const OtherSignInMethodSection({
    super.key,
    this.onGoogle,
    this.onFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Or sign in with',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignInMethodItem(
                imgPath: "assets/images/gg_ic.png",
                title: "Google",
                onTap: onGoogle,
              ),
              const SizedBox(
                width: 8,
              ),
              SignInMethodItem(
                imgPath: "assets/images/fb_ic.png",
                title: "Facebook",
                onTap: onFacebook,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
