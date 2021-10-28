import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class TitleProduct extends StatelessWidget {
  final Product product;
  final double fontSize;
  const TitleProduct({required this.product, required this.fontSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        product.name,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF07195C)),
      );
}
