import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'item_card_class.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  const ItemCard({super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey[600],
      color: Color(0xFF111111),
      elevation: 10,
      child: Container(
        height: 220,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 140,
                  width: 120,
                  child: widget.item.imgUrl!.startsWith("http")
                      ? Image.network(widget.item.imgUrl!)
                      : Image.asset(
                          widget.item.imgUrl!,
                        )),
            ],
          ),
          Text(
            widget.item.itemName!,
            style: TextStyle(color: Colors.white),
          ),
          RatingBar.builder(
            itemSize: 12,
            initialRating: widget.item.rating!,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${widget.item.itemPrice}",
                style: const TextStyle(color: Colors.white),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                  icon: isChecked
                      ? const Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.amber,
                        )
                      : const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                        ))
            ],
          )
        ]),
      ),
    );
  }
}
