import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String images;

  const ProductCard({
    super.key,
    this.images = "",
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey[400],
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.images),
            ),
            shape: BoxShape.circle,
          ),
        ));
  }
}
