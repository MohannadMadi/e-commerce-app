import 'package:flutter/material.dart';

class SettingsSection extends StatefulWidget {
  final List<Widget> children;
  const SettingsSection({super.key, required this.children});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF121212),
        child: Column(
          children: [
            const Divider(),
            Column(
              children: widget.children,
            ),
            const Divider()
          ],
        ));
  }
}
