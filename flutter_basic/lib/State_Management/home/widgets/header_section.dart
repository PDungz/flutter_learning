import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management/home/widgets/option_item.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //! viewPadding.top: lấy ra kích thước Height của Status Bar
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    print("height của status bar là: $statusBarHeight");
    return Container(
      padding:
          EdgeInsets.only(top: statusBarHeight, bottom: 8, left: 16, right: 16),
      color: const Color(0xff1F293D),
      child: Row(
        children: [
          Image.asset(
            "assets/images/product_logo.png",
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 16,
          ),
          const Expanded(
            child: Row(
              children: [
                OptionItem(
                    iconPath: "assets/images/location_ic.png",
                    title: "Hồ Chí Minh"),
                OptionItem(
                    iconPath: "assets/images/language_ic.png",
                    title: "Tiếng Việt"),
                SizedBox(
                  width: 8,
                ),
                Spacer(),
                IconButton(onPressed: null, icon: Icon(Icons.logout))
              ],
            ),
          )
        ],
      ),
    );
  }
}
