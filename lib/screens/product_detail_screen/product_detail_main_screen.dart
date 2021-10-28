import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_detail_screen/widgets/body_widget.dart';
import 'package:shop_app/services/constants.dart';
import 'package:shop_app/services/utils.dart';

class ProductDetailMainScreen extends StatelessWidget {
  final Product product;
  const ProductDetailMainScreen({required this.product, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Color(Constants.mainColor),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon(Icons.favorite_outlined),
                onPressed: () {
                  Utils.workWithAddOrDeleteProductFavorite(
                      context: context, product: product);
                },
              ),
            ),
          ],
        ),
        body: _createBody(),
      );

  Widget _createBody() => BodyWidget(product: product);
}
