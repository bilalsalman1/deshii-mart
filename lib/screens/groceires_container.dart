import 'package:flutter/material.dart';

class GroceiresContainer extends StatelessWidget {
  final Color colors;
  final String title;
  final AssetImage image;
  const GroceiresContainer(
      {super.key,
      required this.colors,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 240,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: colors),
      child: Row(
        children: [Image(image: image), Text(title)],
      ),
    );
  }
}
