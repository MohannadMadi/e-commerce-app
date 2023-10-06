import 'package:flutter/material.dart';

import 'package:course/model/item_card_class.dart';

class ItemCopy extends StatefulWidget {
  final Item item;
  const ItemCopy({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ItemCopy> createState() => _ItemCopyState();
}

class _ItemCopyState extends State<ItemCopy> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(widget.item.imgUrl!),
        )
      ],
    );
  }
}
