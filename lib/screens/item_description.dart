// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:course/custom_widgets/rating_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../model/item_card_class.dart';

class DescriptionPage extends StatefulWidget {
  Item item;
  DescriptionPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  List<Item> favorites = [];
  List<Widget> icons = [];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2,
        shadowColor: Color(0xFF555555),
        title: const Text(
          "\\.Splash",
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Container(
              color: Colors.grey[900],
              height: MediaQuery.of(context).size.height / 2.8,
              width: double.infinity,
              child: Image.asset(widget.item.imgUrl!)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 140,
                height: 30,
                color: Colors.orange[900],
                child: Text(
                  "${widget.item.itemPrice!} \$",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(9)),
                child: CustomRatingIndicator(item: widget.item),
              ),
              Container(
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.orange[200],
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      favorites.contains(widget.item)
                          ? favorites.remove(widget.item)
                          : favorites.add(widget.item);
                    });
                  },
                  icon: favorites.contains(widget.item)
                      ? Icon(Icons.star)
                      : Icon(Icons.star_border_outlined),
                  color: Colors.orange[900],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  widget.item.itemName!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          ListTile(
            title: Text(
              "Description",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            trailing: Text(
              "sad",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Row(
            children: [
              InkWell(
                child: Text(
                  "+",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Text(
                "${counter}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              InkWell(
                child: Text(
                  "+",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
