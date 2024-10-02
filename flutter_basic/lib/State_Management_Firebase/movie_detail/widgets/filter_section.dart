import 'package:flutter/material.dart';
import 'package:flutter_basic/State_Management_Firebase/movie_detail/widgets/filter_item_widget.dart';
import 'package:flutter_svg/svg.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Row(
        children: [
          Expanded(
              child: FilterItemWidget(
            icon: SvgPicture.asset("assets/svg/calendar.svg"),
            titleText: "April, 18",
          )),
          Expanded(
              child: FilterItemWidget(
                  icon: SvgPicture.asset("assets/svg/sort.svg"),
                  titleText: "Time")),
          Expanded(
              child: FilterItemWidget(
                  icon: SvgPicture.asset("assets/svg/option.svg"),
                  titleText: "By cinema")),
        ],
      ),
    );
  }
}
