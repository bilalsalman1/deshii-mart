import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final Icon subIcon;
  final VoidCallback onPressed;
  const AppbarWidget(this.icon, this.subIcon, this.text, this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      leading: IconButton(onPressed: onPressed, icon: icon),
      actions: [
        IconButton(onPressed: onPressed, icon: subIcon),
      ],
    );
  }
}
