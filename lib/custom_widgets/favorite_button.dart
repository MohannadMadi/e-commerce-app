// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FavoriteButton extends StatefulWidget {
  Function onChange;
  FavoriteButton({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  bool isFavoriteChecked = false;

  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            isFavoriteChecked = !isFavoriteChecked;
          });
          widget.onChange();
        },
        child: Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(60)),
          child: isFavoriteChecked
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
        ));
  }
}
