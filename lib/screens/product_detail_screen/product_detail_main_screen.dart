import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_detail_screen/widgets/body_widget.dart';
import 'package:shop_app/services/constants.dart';

class ProductDetailMainScreen extends StatelessWidget {
  final Product product;
  const ProductDetailMainScreen({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Color(Constants.mainColor),
        ),
        body: _createBody(),
      );

  Widget _createBody() => BodyWidget(product: product);
}
