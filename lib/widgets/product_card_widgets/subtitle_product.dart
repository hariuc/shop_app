import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class SubtitleProduct extends StatelessWidget {
  final Product product;
  final double fontSize;
  const SubtitleProduct(
      {required this.product, required this.fontSize, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        'iOS, ecran tactil 5.5", GPS, 256 GB, 12 mpx',
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF424A56)),
      );
}
