// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_basic/l10n/generated/app_localizations.dart';

import 'option_item.dart';

class HeaderSection extends StatelessWidget {
  final void Function()? onPressed;
  const HeaderSection({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    //! viewPadding.top: lấy ra kích thước Height của Status Bar
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
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
          Expanded(
            child: Row(
              children: [
                const OptionItem(
                    iconPath: "assets/images/location_ic.png",
                    title: "Hồ Chí Minh"),
                OptionItem(
                    iconPath: "assets/images/language_ic.png",
                    title: AppLocalizations.of(context)!.local_language),
                const SizedBox(
                  width: 8,
                ),
                const Spacer(),
                IconButton(
                    onPressed: onPressed,
                    icon: const Icon(
                      Icons.person_pin_rounded,
                      size: 30,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
