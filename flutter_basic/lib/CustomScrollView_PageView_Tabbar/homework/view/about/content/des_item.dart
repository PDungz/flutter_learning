import 'package:flutter/material.dart';

class desItem extends StatelessWidget {
  const desItem({
    super.key,
    required this.primaryColor,
    required this.title,
    required this.des,
    required this.onborder,
  });

  final Color primaryColor;
  final String title;
  final String des;
  final bool onborder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Text(
              title,
              style: TextStyle(color: primaryColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                border: onborder
                    ? Border.all(color: Colors.white)
                    : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(4)),
            child: SizedBox(
              width: onborder ? 40 : MediaQuery.of(context).size.width * 0.6,
              child: Text(
                des,
                style: TextStyle(color: primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
