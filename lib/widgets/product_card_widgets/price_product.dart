import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class PriceProduct extends StatelessWidget {
  final Product product;
  final double fontSize1;
  final double fontSize2;
  const PriceProduct(
      {required this.product,
      required this.fontSize1,
      required this.fontSize2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => RichText(
          text: TextSpan(children: [
        TextSpan(
            text: '${product.price},-    ',
            style: TextStyle(
                fontSize: fontSize1,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF035A97))),
        
        TextSpan(
            text: '${product.price},-',
            style: TextStyle(
                fontSize: fontSize2,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF9CB1BC))),
      ]));
}
