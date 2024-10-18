import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: Image.network(
      // product.imageUrl,
      'https://www.mrcod.pk/product/chocolate-shake/',
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
    ));
  }
}
