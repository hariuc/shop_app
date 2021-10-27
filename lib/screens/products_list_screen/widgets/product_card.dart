import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_detail_screen/product_detail_main_screen.dart';
import 'package:shop_app/widgets/product_card_widgets/price_product.dart';
import 'package:shop_app/widgets/product_card_widgets/subtitle_product.dart';
import 'package:shop_app/widgets/product_card_widgets/title_product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => _navigateToDetailProduct(context: context),
        child: Card(
          elevation: 2.0,
          child: Row(
            children: [
              _createImage(),
              Column(
                children: [
                  TitleProduct(product: product, fontSize: 18),
                  SubtitleProduct(product: product, fontSize: 12),
                  PriceProduct(
                    product: product,
                    fontSize1: 16,
                    fontSize2: 11,
                  ),
                  _createButtonPanel(),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _createImage() => Image.network(
        product.category.icon,
        width: 110,
        height: 82.62,
      );

  Widget _createButtonPanel() => Row(
        children: [
          _createButton(icon: const Icon(Icons.favorite_border)),
          _createButton(icon: const Icon(Icons.shopping_cart)),
        ],
      );

  Widget _createButton({required Icon icon}) => Container(
        height: 36,
        width: 36,
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: icon,
          ),
        ),
      );

  Future<void> _navigateToDetailProduct({required BuildContext context}) async {
    var route = MaterialPageRoute(
        builder: (context) => ProductDetailMainScreen(product: product));
    await Navigator.push(context, route);
  }
}
