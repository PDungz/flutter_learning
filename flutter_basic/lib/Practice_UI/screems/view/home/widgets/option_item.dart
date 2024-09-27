import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OptionItem extends StatefulWidget {
  const OptionItem({
    super.key,
    required this.svgPath,
    required this.title,
  });

  final String svgPath;
  final String title;

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(
            widget.svgPath,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
