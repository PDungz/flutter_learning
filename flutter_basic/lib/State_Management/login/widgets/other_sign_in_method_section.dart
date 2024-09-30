import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management/login/widgets/sign_in_method_item.dart';

class OtherSignInMethodSection extends StatelessWidget {
  const OtherSignInMethodSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Or sign in with',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignInMethodItem(
                  imgPath: "assets/images/gg_ic.png", title: "Google"),
              SizedBox(
                width: 8,
              ),
              SignInMethodItem(
                  imgPath: "assets/images/fb_ic.png", title: "Facebook"),
            ],
          ),
        ],
      ),
    );
  }
}
