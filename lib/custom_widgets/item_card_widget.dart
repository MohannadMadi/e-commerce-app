import 'package:course/custom_widgets/rating_indicator.dart';
import 'package:flutter/material.dart';
import '../model/item_card_class.dart';
import '../screens/item_description.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final Function onCartPressed;
  const ItemCard({super.key, required this.item, required this.onCartPressed});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isCartChecked = false;
  GlobalKey product = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double cardSize = (MediaQuery.of(context).size.width / 2.25) < 200
        ? (MediaQuery.of(context).size.width / 2.25)
        : 200;
    return InkWell(
      onTap: () {
        print(MediaQuery.of(context).size.width);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DescriptionPage(item: widget.item)));
      },
      child: Stack(
        alignment: Alignment(.8, -.9),
        children: [
          Container(
            width: cardSize,
            child: Column(
              children: [
                Card(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Color.fromARGB(255, 26, 24, 24),
                  child: Container(
                    height: cardSize,
                    width: cardSize,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: cardSize - 20,
                            child: widget.item.imgUrl!.startsWith("http")
                                ? Image.network(widget.item.imgUrl!)
                                : Image.asset(
                                    widget.item.imgUrl!,
                                  )),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.item.itemName!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  widget.onCartPressed();
                                },
                                icon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.amber,
                                ))
                          ],
                        ),
                        Container(
                          width: cardSize - 10,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "\$${widget.item.itemPrice}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomRatingIndicator(item: widget.item)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          ////////////////////////////////////////////////////////////////
          // FavoriteButton(onChange: ,)
        ],
      ),
    );
  }
}
