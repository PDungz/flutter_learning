// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  final int? price;
  const PriceItem({
    Key? key,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = price != null ? "$priceđ" : "•";
    final textStyle = price != null
        ? const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          )
        : const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xff637394),
          );
    return Text(
      text,
      style: textStyle,
    );
  }
}

class ShowtimeItem extends StatelessWidget {
  final String time;
  final String typeOfTheater;
  final String theaterName;
  final List<int?> listPriceByPriceType;
  const ShowtimeItem({
    Key? key,
    required this.time,
    required this.typeOfTheater,
    required this.theaterName,
    required this.listPriceByPriceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
                child: TitleAndContent(
                    title: Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    content: Text(
                      typeOfTheater,
                      style: const TextStyle(
                        color: Color(0xff637394),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: VerticalDivider(
                color: const Color(0xff6D9EFF).withOpacity(.1),
                width: 1,
                thickness: 1,
                // color: Color(0xff6d9eff),
              ),
            ),
            Expanded(
                flex: 4,
                child: TitleAndContent(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    title: Text(
                      theaterName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    content: Row(
                      children: [
                        Expanded(
                            child: PriceItem(
                          price: listPriceByPriceType[0],
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: PriceItem(
                          price: listPriceByPriceType[1],
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: PriceItem(
                          price: listPriceByPriceType[2],
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: PriceItem(
                          price: listPriceByPriceType[3],
                        )),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

class TitleAndContent extends StatelessWidget {
  final Widget title;
  final Widget content;
  final CrossAxisAlignment crossAxisAlignment;
  const TitleAndContent(
      {Key? key,
      required this.title,
      required this.content,
      this.crossAxisAlignment = CrossAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        title,
        const SizedBox(
          height: 4,
        ),
        content
      ],
    );
  }
}
