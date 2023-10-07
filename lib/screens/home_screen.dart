import 'package:flutter/material.dart';
import '../custom_widgets/custom_drawer.dart';
import '../custom_widgets/item_card_widget.dart';
import '../model/item_card_class.dart';
import '../model/user.dart';

class HomeScreen extends StatefulWidget {
  final CustomUser user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double bottom = 40;
  double left = 40;
  bool animate = false;
  late Item selectedItem = item1;
  late Offset itemPosition = const Offset(0, 0);
  @override
  void initState() {
    super.initState();
  }

  getPos(GlobalKey productKey) {
    RenderBox renderBox =
        productKey.currentContext!.findRenderObject() as RenderBox;
    itemPosition = renderBox.localToGlobal(Offset.zero);
    debugPrint(itemPosition.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          drawer: CustomDrawer(
            user: widget.user,
          ),
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 2,
            shadowColor: const Color(0xFF555555),
            title: const Text(
              ".\\Splash",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          body: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              Wrap(
                                  spacing: 6,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    ...items.map((e) {
                                      final GlobalKey productKey = GlobalKey(
                                          debugLabel:
                                              "item ${items.indexOf(e)}");
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        child: Column(
                                          children: [
                                            ItemCard(
                                              key: productKey,
                                              item: e,
                                              onCartPressed: () {
                                                setState(() {
                                                  selectedItem = e;
                                                  getPos(productKey);
                                                  e.animate = !e.animate;
                                                  bottom = itemPosition.dy;
                                                  left = itemPosition.dx;
                                                  animate = e.animate;

                                                  if (widget.user.addedTocart!
                                                      .contains(e)) {
                                                    widget.user.addedTocart!
                                                        .remove(e);
                                                    animate = e.animate;
                                                  } else {
                                                    widget.user.addedTocart!
                                                        .add(e);
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList()
                                  ]),
                            ],
                          ),
                          const Row()
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
