import 'package:flutter/material.dart';

class GroupBySection extends StatelessWidget {
  const GroupBySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color(0xff253554),
      child: const Row(
        children: [
          Expanded(
              child: Center(
            child: Text(
              "Time",
              style: TextStyle(
                  color: Color(
                    0xff637394,
                  ),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          )),
          SizedBox(
            width: 16,
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Adult",
                      style: TextStyle(
                          color: Color(0xff637394),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )),
                    Expanded(
                        child: Text(
                      "Child",
                      style: TextStyle(
                          color: Color(0xff637394),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )),
                    Expanded(
                        child: Text(
                      "Student",
                      style: TextStyle(
                          color: Color(0xff637394),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )),
                    Expanded(
                        child: Text(
                      "VIP",
                      style: TextStyle(
                          color: Color(0xff637394),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
