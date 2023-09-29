// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../model/item_card_class.dart';

class CustomRatingIndicator extends StatefulWidget {
  final Item item;
  const CustomRatingIndicator({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<CustomRatingIndicator> createState() => _CustomRatingIndicatorState();
}

class _CustomRatingIndicatorState extends State<CustomRatingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      decoration: BoxDecoration(
          color: widget.item.rating! >= 4
              ? Colors.green[900]
              : widget.item.rating! >= 3
                  ? Color.fromARGB(255, 210, 132, 6)
                  : (widget.item.rating! < 3 && widget.item.rating! > 1)
                      ? Colors.red[900]
                      : Colors.grey,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.white,
          ),
          Text(
            "${widget.item.rating}",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
    );
  }
}
