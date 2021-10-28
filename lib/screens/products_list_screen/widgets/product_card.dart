import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_detail_screen/product_detail_main_screen.dart';
import 'package:shop_app/services/utils.dart';
import 'package:shop_app/widgets/product_card_widgets/price_product.dart';
import 'package:shop_app/widgets/product_card_widgets/subtitle_product.dart';
import 'package:shop_app/widgets/product_card_widgets/title_product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    colorIcon = Utils.getIconColor(product: widget.product);
    return InkWell(
      onTap: () => _navigateToDetailProduct(context: context),
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
              bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 82),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 12),
                    child: _createImage(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 10, bottom: 10),
                      child:
                          TitleProduct(product: widget.product, fontSize: 18),
                    ),
                    SubtitleProduct(product: widget.product, fontSize: 12),
                    const SizedBox(
                      height: 10,
                    ),
                    PriceProduct(
                      product: widget.product,
                      fontSize1: 16,
                      fontSize2: 11,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _createButtonPanel(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createImage() => Image.network(
        widget.product.category.icon,
        width: 110,
        height: 82.62,
      );

  Widget _createButtonPanel() => Row(
        children: [
          _createButton(
              icon: Icon(
                Icons.favorite_border,
                color: colorIcon,
              ),
              function: _workWithFavorit),
          const SizedBox(
            width: 24,
          ),
          _createButton(icon: const Icon(Icons.shopping_cart), function: () {}),
        ],
      );

  Widget _createButton({required Icon icon, required Function function}) =>
      Container(
        height: 36,
        width: 36,
        child: Center(
          child: IconButton(
            onPressed: () => function,
            icon: icon,
          ),
        ),
      );

  Future<void> _navigateToDetailProduct({required BuildContext context}) async {
    var route = MaterialPageRoute(
        builder: (context) => ProductDetailMainScreen(product: widget.product));
    await Navigator.push(context, route);
  }

  void _workWithFavorit(){
    Utils.workWithAddOrDeleteProductFavorite(
                    context: context, product: widget.product);
                setState(() {
                  colorIcon = Utils.getIconColor(product: widget.product);
                });
  }
}
