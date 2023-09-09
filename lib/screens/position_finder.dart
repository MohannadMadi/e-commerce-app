import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PositionFinder extends StatefulWidget {
  const PositionFinder({super.key});

  @override
  State<PositionFinder> createState() => _PositionFinderState();
}

class _PositionFinderState extends State<PositionFinder> {
  double whiteBoxTop = 0;
  double whiteBoxLeft = 0;
  List<Widget> theList = List.filled(
      10,
      Container(
        color: Colors.deepPurple,
        width: 150,
        height: 150,
      ));

  late Offset widgetPosition = Offset(0, 0);
  late Size widgetSize;
  bool big = false;
  double whiteBoxHeight = 50;
  double whiteBoxWidth = 50;
  GlobalKey widgetKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  setPosAndSize(GlobalKey widgetKey) {
    RenderBox renderBox =
        widgetKey.currentContext!.findRenderObject() as RenderBox;
    widgetPosition = renderBox.localToGlobal(Offset.zero);
    widgetSize = renderBox.size;
    print(widgetPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Wrap(
                children: [
                  ...theList.map((e) {
                    final widgetKey =
                        GlobalKey(debugLabel: "key${theList.indexOf(e)}");

                    return InkWell(
                      onDoubleTap: () {
                        big
                            ? setState(() {
                                whiteBoxHeight = 50;
                                whiteBoxWidth = 50;
                                big = !big;
                              })
                            : setState(() {
                                setPosAndSize(widgetKey);
                                whiteBoxHeight = widgetSize.height;
                                whiteBoxWidth = widgetSize.width;
                                big = !big;
                              });
                      },
                      onTap: () {
                        setState(() {
                          setPosAndSize(widgetKey);
                          whiteBoxTop = widgetPosition.dy;
                          whiteBoxLeft = widgetPosition.dx;
                        });
                      },
                      child: Padding(
                        key: widgetKey,
                        padding: const EdgeInsets.all(8.0),
                        child: e,
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: whiteBoxTop,
            left: whiteBoxLeft,
            child: Container(
              width: whiteBoxWidth,
              height: whiteBoxHeight,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
