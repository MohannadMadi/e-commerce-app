// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomListTile extends StatefulWidget {
  final String text;
  final Widget? pageRoute;
  final Function? onpressed;
  final Icon icon;
  CustomListTile({
    Key? key,
    this.onpressed,
    required this.text,
    this.pageRoute,
    required this.icon,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            onTap: () {
              widget.pageRoute == null
                  ? widget.onpressed!()
                  : Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => widget.pageRoute!));
            },
            leading: Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            trailing: widget.icon),
        Divider(
          color: Colors.blue,
        )
      ],
    );
  }
}
