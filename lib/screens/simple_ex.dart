import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Simple extends StatefulWidget {
  const Simple({super.key});

  @override
  State<Simple> createState() => _SimpleState();
}

final GlobalKey containerKey = GlobalKey();
final GlobalKey buttonKey = GlobalKey();
Offset containerPosition = Offset(0, 0);
late Size containerSize;

class _SimpleState extends State<Simple> {
  setPositionAndSize(key) {
    setState(() {
      RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
      containerPosition = renderBox.localToGlobal(Offset.zero);
      containerSize = renderBox.size;
    });
    print(containerPosition);
    print(containerSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FloatingActionButton(
                key: buttonKey,
                onPressed: () {
                  setPositionAndSize(buttonKey);
                }),
            InkWell(
                onTap: () {
                  setPositionAndSize(containerKey);
                },
                child: Container(
                  key: containerKey,
                  width: 50,
                  height: 50,
                  color: Colors.amber,
                )),
          ],
        ),
      ),
    );
  }
}
