// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final Function onChange;
  const FavoriteButton({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavoriteChecked = false;

  @override
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
