// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:course/model/item_card_class.dart';

class ItemCopy extends StatefulWidget {
  Item item;
  ItemCopy({
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
